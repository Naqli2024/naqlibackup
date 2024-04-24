import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Partner/Dashboard/detailsPage.dart';
import 'package:flutter_application_1/Users/SingleUser/singleuser.dart';
import 'package:flutter_application_1/Widgets/colorContainer.dart';
import 'package:flutter_application_1/Widgets/formText.dart';
import 'package:flutter_application_1/pieChart/app_colors.dart';
import 'package:flutter_application_1/pieChart/indicator.dart';
import 'package:flutter_application_1/Widgets/customButton.dart';
import 'package:flutter_application_1/echarts_data.dart';
import 'package:graphic/graphic.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sizer/sizer.dart';
import 'dart:ui';

class Bookings1 extends StatefulWidget {
  final String? partner;
  final String? unitType;
  final String? operatorName;
  Bookings1({this.operatorName, this.partner, this.unitType});
  @override
  State<Bookings1> createState() => _Bookings1State();
}

class _Bookings1State extends State<Bookings1> {
  PageController page = PageController();
  SideMenuController sideMenu = SideMenuController();
  ScrollController _scrollController = ScrollController();
  Stream<List<Map<String, dynamic>>>? _currentStream;
  bool value = false;
  String month = '';
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  bool isButtonEnabled = false;
  bool isButtonEnabled1 = false;
  bool isButtonEnabled2 = false;
  int? selectedRadioValue;
  int? selectedRadioValue1;
  int? selectedRadioValue2;
  bool payNowButtonEnabled = false;
  String? selectedValue;

  @override
  void initState() {
    sideMenu.addListener((p0) {
      page.jumpToPage(p0);
    });
    _currentStream = allBookings();
    super.initState();
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
        String? partnerId = widget.partner;
        String? operator = widget.operatorName;
        print(
            '$partnerId---------------------------------------------------------------------------------');
        // Query for vehicleBooking collection for this user
        QuerySnapshot<Map<String, dynamic>> vehicleSnapshot = await firestore
            .collection('user')
            .doc(userId)
            .collection('vehicleBooking')
            .get();

        // Query for equipmentBooking collection for this user
        QuerySnapshot<Map<String, dynamic>> equipmentSnapshot = await firestore
            .collection('user')
            .doc(userId)
            .collection('equipmentBooking')
            .get();

        // Iterate through vehicleBooking documents and extract relevant fields
        vehicleSnapshot.docs.forEach((vehicleDoc) {
          Map<String, dynamic> bookingData = {
            'type': 'vehicle',
            'userId': userId,
            'operName': operator,
            'firstName': firstName,
            'lastName': lastName,
            'load': vehicleDoc['load'],
            'truck': vehicleDoc['truck'],
            'time': vehicleDoc['time'],
            'labour': vehicleDoc['labour'],
            'productValue': vehicleDoc['productValue'],
            'date': vehicleDoc['date'],
            'size': vehicleDoc['size'],
            'bookingid': vehicleDoc['bookingid'],
          };
          combinedData.add(bookingData);
        });

        // Iterate through equipmentBooking documents and extract relevant fields
        equipmentSnapshot.docs.forEach((equipmentDoc) {
          Map<String, dynamic> bookingData = {
            'type': 'equipment',
            'userId': userId,
            'operName': operator,
            'firstName': firstName,
            'lastName': lastName,
            'truck': equipmentDoc['truck'],
            'time': equipmentDoc['time'],
            'date': equipmentDoc['date'],
            'size': equipmentDoc['size'],
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

  void enablePayNowButton() {
    setState(() {
      payNowButtonEnabled = true;
    });
  }

  void disablePayNowButton() {
    setState(() {
      payNowButtonEnabled = false;
    });
  }

  bool isAnyCheckboxSelected() {
    return checkbox1 || checkbox2 || checkbox3;
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
                          child: Text('Booking History',
                              style: BookingHistoryText.helvetica40),
                        ),
                      ),
                    ),
                  ],
                ),
                StreamBuilder<List<Map<String, dynamic>>>(
                  stream: allBookings(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                          child: Text("You haven't done any bookings"));
                    } else {
                      String? partner = widget.partner;
                      return ElevationContainer(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SingleChildScrollView(
                            child: Container(
                              height:
                                  400, // Adjust the height as per your requirement
                              width: 1150,
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
                                    color: Color.fromRGBO(112, 112, 112, 1)
                                        .withOpacity(0.3),
                                  ),
                                ),
                                headingRowColor: MaterialStateColor.resolveWith(
                                    (states) => Color.fromRGBO(75, 61, 82, 1)),
                                dividerThickness: 1.0,
                                dataRowHeight: 65,
                                headingRowHeight: 70,
                                columns: DataSource(snapshot.data!, context)
                                    .getColumns(),
                                rows: snapshot.data!.map((user) {
                                  return DataRow(
                                    cells: DataSource(snapshot.data!, context)
                                        .getCells(user, partner),
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
                          child: Text('Booking History',
                              style: BookingHistoryText.helvetica40),
                        ),
                      ),
                    ),
                  ],
                ),
                StreamBuilder<List<Map<String, dynamic>>>(
                  stream: allBookings(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                          child: Text("You haven't done any bookings"));
                    } else {
                      String? partner = widget.partner;
                      return ElevationContainer(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SingleChildScrollView(
                            child: Container(
                              height:
                                  400, // Adjust the height as per your requirement
                              width: 1150,
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
                                    color: Color.fromRGBO(112, 112, 112, 1)
                                        .withOpacity(0.3),
                                  ),
                                ),
                                headingRowColor: MaterialStateColor.resolveWith(
                                    (states) => Color.fromRGBO(75, 61, 82, 1)),
                                dividerThickness: 1.0,
                                dataRowHeight: 65,
                                headingRowHeight: 70,
                                columns: DataSource(snapshot.data!, context)
                                    .getColumns(),
                                rows: snapshot.data!.map((user) {
                                  return DataRow(
                                    cells: DataSource(snapshot.data!, context)
                                        .getCells(user, partner),
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
          ));
        }
      });
    });
  }
}

class DataSource {
  final List<Map<String, dynamic>> candidates;
  final BuildContext context;

  DataSource(this.candidates, this.context);

  List<DataColumn> getColumns() {
    return [
      DataColumn(
          label: Text(
        'Booked',
        style: BookingHistoryText.sfpro20white,
        textAlign: TextAlign.center,
      )),
      DataColumn(
          label: Text(
        'Booking No',
        softWrap: true,
        style: BookingHistoryText.sfpro20white,
        textAlign: TextAlign.center,
      )),
      DataColumn(
          label: Text(
        'Quote price',
        softWrap: true,
        style: BookingHistoryText.sfpro20white,
        textAlign: TextAlign.center,
      )),
      DataColumn(
          label: Text(
        'Date',
        style: BookingHistoryText.sfpro20white,
        textAlign: TextAlign.center,
      )),
      DataColumn(
          label: Text(
        'Time',
        style: BookingHistoryText.sfpro20white,
        textAlign: TextAlign.center,
      )),
      DataColumn(
          label: Text(
        'Mode',
        style: BookingHistoryText.sfpro20white,
        textAlign: TextAlign.center,
      )),
      DataColumn(
        label: Text(
          'Location',
          style: BookingHistoryText.sfpro20white,
          textAlign: TextAlign.center,
        ),
        numeric: true,
      ),
      DataColumn(
          label: Text(
        'Action',
        style: BookingHistoryText.sfpro20white,
        textAlign: TextAlign.center,
      )),
    ];
  }

  List<DataCell> getCells(Map<String, dynamic> user, String? partner) {
    return [
      DataCell(Text(user['firstName']?.toString() ?? 'nill',
          style: BookingHistoryText.sfpro20black)),
      DataCell(
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Details(
                  partner: partner,
                  user: user['firstName'],
                  operName: user['operName'],
                  pickup: 'xxxxxxxxxxxxxxxx',
                  productValue: user['productValue'],
                  dropoff: 'xxxxxxxxxxxxxxxx',
                  labour: user['labour'],
                  load: user['load'],
                  bookingid: user['bookingid'],
                  truck: user['truck'],
                  date: user['date'],
                  time: user['time'],
                );
              },
            );
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(173, 28, 134, 1), // Underline color
                  width: 2.0, // Underline thickness
                ),
              ),
            ),
            child: Text(
              user['bookingid']?.toString() ?? 'nill',
              style: TextStyle(
                fontSize: 17,
                letterSpacing: 1,
                fontFamily: 'SFproText',
                color: Color.fromRGBO(173, 28, 134, 1),
              ),
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          width: 120, // Set the desired width
          height: 35, // Set the desired height
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black, // Set the border color here
              width: 1.0, // Set the border width here
            ),
            borderRadius: BorderRadius.circular(
                10.0), // Set the border radius to create a circular border
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: '', // Add any hint text if needed
              border: InputBorder
                  .none, // Remove the border from the TextField itself
            ),
          ),
        ),
      ),
      DataCell(Text(user['date']?.toString() ?? 'nill',
          style: BookingHistoryText.sfpro20black)),
      DataCell(Text(user['time']?.toString() ?? 'nill',
          style: BookingHistoryText.sfpro20black)),
      DataCell(Text(user['truck']?.toString() ?? 'nill',
          style: BookingHistoryText.sfpro20black)),
      DataCell(Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: 5,
          ),
          SizedBox(width: 5),
          Text('Xxxxxxxx', style: BookingHistoryText.sfpro20black),
          SizedBox(width: 30),
          Image.network(
            'assets/path 1514.png',
            width: 24,
            height: 20,
          ),
          SizedBox(width: 5),
          Text('Xxxxxxxx', style: BookingHistoryText.sfpro20black),
        ],
      )),
      DataCell(
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                // Add your onPressed functionality here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color.fromRGBO(99, 194, 109, 1), // Background color
                minimumSize: Size(100, 40),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Adjust the radius as needed
                ),
              ),
              child: Text("Send",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SFProText',
                      fontSize: 13)),
            ),
            SizedBox(width: 10),
            Image.network(
              'assets/Group 1982.png',
              width: 35,
              height: 35,
            ),
          ],
        ),
      ),
    ];
  }
}
