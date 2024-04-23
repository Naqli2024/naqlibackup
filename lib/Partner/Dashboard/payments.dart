import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Controllers/allUsersFormController.dart';
import 'package:flutter_application_1/Users/SingleUser/singleuser.dart';
import 'package:flutter_application_1/Widgets/colorContainer.dart';
import 'package:flutter_application_1/Widgets/formText.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sizer/sizer.dart';

class Payments extends StatefulWidget {
  final String? user;
  final String? unitType;
  Payments({this.user, this.unitType});
  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  PageController page = PageController();
  SideMenuController sideMenu = SideMenuController();
  final ScrollController _scrollController1 = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  AllUsersFormController controller = AllUsersFormController();
  final fromDate = TextEditingController();
  final toDate = TextEditingController();
  Stream<List<Map<String, dynamic>>>? _currentStream;
  @override
  void dispose() {
    _scrollController1.dispose();
    _scrollController2.dispose();
    super.dispose();
  }

  Stream<List<Map<String, dynamic>>> allBookings() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Query for all documents in the 'user' collection
    Stream<QuerySnapshot<Map<String, dynamic>>> userStream =
        firestore.collection('user').snapshots();

    // Merge the streams using flatMap to process each user document separately
    Stream<List<Map<String, dynamic>>> mergedStream =
        userStream.asyncMap((userSnapshot) async {
      List<Map<String, dynamic>> combinedData = [];

      // Iterate through each user document
      for (QueryDocumentSnapshot<Map<String, dynamic>> userDoc
          in userSnapshot.docs) {
        // Extract user data
        String firstName = userDoc.data()?['firstName'] ?? '';
        String lastName = userDoc.data()?['lastName'] ?? '';
        String userId = userDoc.id;

        // Query for vehicleBooking collection for this user
        QuerySnapshot<Map<String, dynamic>> vehicleSnapshot = await firestore
            .collection('user')
            .doc(userId)
            .collection('vehicleBooking')
            .get();

        // Iterate through vehicleBooking documents and extract relevant fields
        vehicleSnapshot.docs.forEach((vehicleDoc) {
          Map<String, dynamic> bookingData = {
            'type': 'vehicle',
            'userId': userId,
            'firstName': firstName,
            'lastName': lastName,
            'truck': vehicleDoc['truck'],
            'date': vehicleDoc['date'],
            'size': vehicleDoc['size'],
            'bookingid': vehicleDoc['bookingid'],
          };
          combinedData.add(bookingData);
        });

        // Query for equipmentBooking collection for this user
        QuerySnapshot<Map<String, dynamic>> equipmentSnapshot = await firestore
            .collection('user')
            .doc(userId)
            .collection('equipmentBooking')
            .get();

        // Iterate through equipmentBooking documents and extract relevant fields
        equipmentSnapshot.docs.forEach((equipmentDoc) {
          Map<String, dynamic> bookingData = {
            'type': 'equipment',
            'userId': userId,
            'firstName': firstName,
            'lastName': lastName,
            'equipment': equipmentDoc['equipment'],
            'quantity': equipmentDoc['quantity'],
            'bookingid': equipmentDoc['bookingid'],
          };
          combinedData.add(bookingData);
        });
      }

      return combinedData;
    }).asBroadcastStream();

    // Return the merged stream
    return mergedStream;
  }

  Stream<Map<String, dynamic>> allUserData() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Query for user documents
    Stream<QuerySnapshot<Map<String, dynamic>>> userStream =
        firestore.collection('user').snapshots();

    // Transform the snapshot to Map<String, dynamic>
    Stream<Map<String, dynamic>> userDataStream = userStream.map((snapshot) {
      List<Map<String, dynamic>> userDataList = [];

      // Iterate through each document snapshot
      snapshot.docs.forEach((doc) {
        // Extract the 'bookingId' field from each document
        String bookingId = doc.data()['userId'] ?? '';

        // Add the 'bookingId' to the list
        userDataList.add({'userId': bookingId});
      });

      return {'userList': userDataList}; // Return the list of 'bookingId's
    });

    return userDataStream;
  }

  @override
  void initState() {
    _currentStream = allBookings();
    sideMenu.addListener((p0) {
      page.jumpToPage(p0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 850) {
          return SingleChildScrollView(
              child: Container(
            height: 100.h,
            width: 300.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color.fromRGBO(255, 255, 255, 0.925),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(75, 61, 82, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 80, top: 20),
                          child: Text('Payments',
                              style: BookingHistoryText.helvetica40),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(4.w, 8.h, 4.w, 2.h),
                  child: Column(
                    children: [
                      ElevationContainer(
                        child: Container(
                          width: 1070,
                          height: 100, // Increased height to accommodate button
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                              color: Color.fromRGBO(112, 112, 112, 1)
                                  .withOpacity(0.3),
                            ),
                          ),
                          child: StreamBuilder<Map<String, dynamic>>(
                            stream: allUserData(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child:
                                        CircularProgressIndicator()); // Show a loading indicator while waiting for data
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error: ${snapshot.error}'),
                                ); // Show an error message if there's an error
                              } else {
                                // If data is available, build the UI using the retrieved user data
                                List<Map<String, dynamic>> userList =
                                    snapshot.data?['userList'] ?? [];

                                return SingleChildScrollView(
                                  child: Container(
                                    height: 100,
                                    width: 1070,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: userList.length,
                                          itemBuilder: (context, index) {
                                            String bookingId =
                                                userList[index]['userId'] ?? '';
                                            return ListTile(
                                              title: Text(
                                                  'Booking ID: $bookingId'),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Padding(
                        padding: EdgeInsets.only(right: 1.5.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 35,
                              width: 140,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  value: controller.fromDate.text.isNotEmpty
                                      ? controller.fromDate.text
                                      : 'From Date',
                                  items: [
                                    '14/6/2023',
                                    '15/6/2023',
                                    '16/6/2023',
                                    '17/6/2023',
                                    '18/6/2023',
                                    'From Date'
                                  ].map((String? value) {
                                    return DropdownMenuItem<String>(
                                      value: value!,
                                      child: Text(
                                        value!,
                                        style: HomepageText.helvetica16black,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      controller.fromDate.text = newValue!;
                                    });
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    height: 45,
                                    padding: EdgeInsets.only(right: 9),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromRGBO(112, 112, 112, 1)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(0)),
                                      color: Colors.white,
                                    ),
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(Icons.arrow_drop_down_sharp),
                                    iconSize: 25,
                                    iconEnabledColor: Colors.black,
                                    iconDisabledColor: null,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    elevation: 0,
                                    maxHeight: 200,
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromRGBO(112, 112, 112, 1)),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(0),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      ),
                                      color: Colors.white,
                                    ),
                                    scrollPadding: EdgeInsets.all(5),
                                    scrollbarTheme: ScrollbarThemeData(
                                      thickness:
                                          MaterialStateProperty.all<double>(6),
                                      thumbVisibility:
                                          MaterialStateProperty.all<bool>(true),
                                    ),
                                  ),
                                  menuItemStyleData: MenuItemStyleData(
                                    height: 30,
                                    padding: EdgeInsets.only(left: 9, right: 9),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 35,
                              width: 140,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  value: controller.toDate.text.isNotEmpty
                                      ? controller.toDate.text
                                      : 'To date',
                                  items: [
                                    '24/8/2023',
                                    '25/8/2023',
                                    '26/8/2023',
                                    '27/8/2023',
                                    '28/8/2023',
                                    'To date'
                                  ].map((String? value) {
                                    return DropdownMenuItem<String>(
                                      value: value!,
                                      child: Text(
                                        value!,
                                        style: HomepageText.helvetica16black,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      controller.toDate.text = newValue!;
                                    });
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    height: 45,
                                    padding: EdgeInsets.only(right: 9),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromRGBO(112, 112, 112, 1)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(0)),
                                      color: Colors.white,
                                    ),
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(Icons.arrow_drop_down_sharp),
                                    iconSize: 25,
                                    iconEnabledColor: Colors.black,
                                    iconDisabledColor: null,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    elevation: 0,
                                    maxHeight: 200,
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromRGBO(112, 112, 112, 1)),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(0),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      ),
                                      color: Colors.white,
                                    ),
                                    scrollPadding: EdgeInsets.all(5),
                                    scrollbarTheme: ScrollbarThemeData(
                                      thickness:
                                          MaterialStateProperty.all<double>(6),
                                      thumbVisibility:
                                          MaterialStateProperty.all<bool>(true),
                                    ),
                                  ),
                                  menuItemStyleData: MenuItemStyleData(
                                    height: 30,
                                    padding: EdgeInsets.only(left: 9, right: 9),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      StreamBuilder<List<Map<String, dynamic>>>(
                        stream: allBookings(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Center(
                                child: Text("You haven't done any bookings"));
                          } else {
                            return ElevationContainer(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: SingleChildScrollView(
                                  child: Container(
                                    height:
                                        400, // Adjust the height as per your requirement
                                    width: 1100,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      border: Border.all(
                                        color: Color.fromRGBO(112, 112, 112, 1)
                                            .withOpacity(0.3),
                                      ),
                                    ),
                                    constraints: BoxConstraints(minWidth: 1070),
                                    child: DataTable(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        border: Border.all(
                                          color:
                                              Color.fromRGBO(112, 112, 112, 1)
                                                  .withOpacity(0.3),
                                        ),
                                      ),
                                      headingRowColor: MaterialStateColor
                                          .resolveWith((states) =>
                                              Color.fromRGBO(75, 61, 82, 1)),
                                      dividerThickness: 1.0,
                                      dataRowHeight: 65,
                                      headingRowHeight: 70,
                                      columns: DataSource.getColumns(context),
                                      rows: snapshot.data!.map((user) {
                                        return DataRow(
                                          cells: DataSource.getCells(user),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
        } else {
          return SingleChildScrollView(
              child: Container(
            height: 100.h,
            width: 300.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color.fromRGBO(255, 255, 255, 0.925),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(75, 61, 82, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 80, top: 20),
                          child: Text('Payments',
                              style: BookingHistoryText.helvetica40),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(4.w, 12.h, 4.w, 2.h),
                  child: Column(
                    children: [
                      ElevationContainer(
                        child: Scrollbar(
                          controller: _scrollController1,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            controller: _scrollController1,
                            child: Container(
                              width: 1070,
                              height:
                                  100, // Increased height to accommodate button
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Booking ID  XXXXX',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'SFProText',
                                        color: Color.fromRGBO(92, 86, 86, 1)),
                                  ),
                                  Text(
                                    'Booking Value : SAR xxxxxx',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'SFProText',
                                        color:
                                            Color.fromRGBO(149, 143, 143, 1)),
                                  ),
                                  Text(
                                    'Paid : SAR xxxxx',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'SFProText',
                                        color:
                                            Color.fromRGBO(149, 143, 143, 1)),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Balance',
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            fontFamily: 'SFProText'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          // Add your button functionality here
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromRGBO(98, 105, 254, 1),
                                          foregroundColor: Colors.white,
                                          minimumSize: Size(200, 35),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        child: Text('XXXXX SAR',
                                            style: TextStyle(
                                                fontSize: 17.0,
                                                fontFamily: 'SFProText')),
                                      ),
                                    ],
                                  )
                                ],
                              ),

                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                  color: Color.fromRGBO(112, 112, 112, 1)
                                      .withOpacity(0.3),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      ElevationContainer(
                        //width:300; // Set width to match screen width

                        child: Scrollbar(
                          controller: _scrollController2,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            controller: _scrollController2,
                            child: SizedBox(
                              width: 1070,
                              child: DataTable(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8)),
                                  border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1)
                                        .withOpacity(0.3),
                                  ),
                                ),
                                headingRowColor: MaterialStateColor.resolveWith(
                                    (states) => Color.fromRGBO(75, 61, 82, 1)),
                                dividerThickness: 1.0,
                                dataRowHeight: 65,
                                headingRowHeight: 70,
                                columns: <DataColumn>[
                                  DataColumn(
                                      label: Expanded(
                                          child: Text(
                                    'Mode',
                                    style: BookingHistoryText.sfpro20white,
                                    textAlign: TextAlign.center,
                                  ))),
                                  DataColumn(
                                      label: Expanded(
                                          child: Text(
                                    'Booking ID',
                                    style: BookingHistoryText.sfpro20white,
                                    textAlign: TextAlign.center,
                                  ))),
                                  DataColumn(
                                      label: Expanded(
                                          child: Text(
                                    'Date',
                                    style: BookingHistoryText.sfpro20white,
                                    textAlign: TextAlign.center,
                                  ))),
                                  DataColumn(
                                      label: Expanded(
                                          child: Text(
                                    'Unit Type',
                                    style: BookingHistoryText.sfpro20white,
                                    textAlign: TextAlign.center,
                                  ))),
                                  DataColumn(
                                      label: Expanded(
                                          child: Text(
                                    'Payment',
                                    style: BookingHistoryText.sfpro20white,
                                    textAlign: TextAlign.center,
                                  ))),
                                  DataColumn(
                                      label: Expanded(
                                          child: Text(
                                    'Payment Status',
                                    style: BookingHistoryText.sfpro20white,
                                    textAlign: TextAlign.center,
                                  ))),
                                ],
                                rows: <DataRow>[
                                  DataRow(
                                    cells: <DataCell>[
                                      for (var item in [
                                        'Trip',
                                        '#456789231',
                                        '18.2.2022',
                                        'Box truck',
                                        'XXXX SAR',
                                        'Completed'
                                      ])
                                        DataCell(
                                          Container(
                                            height:
                                                65, // Adjust height as needed
                                            alignment: Alignment.center,
                                            child: Text(item,
                                                style: BookingHistoryText
                                                    .sfpro20black),
                                          ),
                                        ),
                                    ],
                                  ),
                                  DataRow(
                                    cells: <DataCell>[
                                      for (var item in [
                                        'Bus Trip',
                                        '#456789231',
                                        '13.6.2022',
                                        'Sleeper',
                                        'XXXX SAR',
                                        'Completed'
                                      ])
                                        DataCell(
                                          Container(
                                            height:
                                                65, // Adjust height as needed
                                            alignment: Alignment.center,
                                            child: Text(item,
                                                style: BookingHistoryText
                                                    .sfpro20black),
                                          ),
                                        ),
                                    ],
                                  ),
                                  DataRow(
                                    cells: <DataCell>[
                                      for (var item in [
                                        'Equipment hire',
                                        '#456789231',
                                        '12.5.2022',
                                        'Crane',
                                        'XXXX SAR',
                                        'Completed'
                                      ])
                                        DataCell(
                                          Container(
                                            height:
                                                65, // Adjust height as needed
                                            alignment: Alignment.center,
                                            child: Text(item,
                                                style: BookingHistoryText
                                                    .sfpro20black),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
        }
      });
    });
  }
}

class DataSource {
  static List<DataColumn> getColumns(BuildContext context) {
    return [
      DataColumn(
        label: Text(
          'Booked by',
          style: BookingHistoryText.sfpro20white,
          textAlign: TextAlign.center,
        ),
      ),
      DataColumn(
        label: Text(
          'Booking ID',
          style: BookingHistoryText.sfpro20white,
          textAlign: TextAlign.center,
        ),
      ),
      DataColumn(
        label: Text(
          'Mode',
          style: BookingHistoryText.sfpro20white,
          textAlign: TextAlign.center,
        ),
      ),
      DataColumn(
        label: Text(
          'Date',
          style: BookingHistoryText.sfpro20white,
          textAlign: TextAlign.center,
        ),
      ),
      DataColumn(
        label: Text(
          'Payment made',
          style: BookingHistoryText.sfpro20white,
          textAlign: TextAlign.center,
        ),
      ),
      DataColumn(
        label: Text(
          'Payment Status',
          style: BookingHistoryText.sfpro20white,
          textAlign: TextAlign.center,
        ),
      ),
    ];
  }

  static List<DataCell> getCells(Map<String, dynamic> user) {
    return [
      DataCell(Text(user['firstName']?.toString() ?? 'nill',
          style: BookingHistoryText.sfpro20black)),
      DataCell(Text(user['bookingid']?.toString() ?? 'nill',
          style: BookingHistoryText.sfpro20black)),
      DataCell(Text(user['truck']?.toString() ?? 'nill',
          style: BookingHistoryText.sfpro20black)),
      DataCell(Text(user['date']?.toString() ?? 'nill',
          style: BookingHistoryText.sfpro20black)),
      DataCell(Text('XXXXX SAR', style: BookingHistoryText.sfpro20black)),
      DataCell(Text('Completed', style: BookingHistoryText.sfpro20black)),
    ];
  }
}
