// ignore_for_file: dead_code

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/DialogBox/SingleTimeUser/bookingConfirmDialog.dart';
import 'package:flutter_application_1/DialogBox/bookingdialog.dart';
import 'package:flutter_application_1/Widgets/customButton.dart';
import 'package:flutter_application_1/Widgets/customTextField.dart';
import 'package:flutter_application_1/Widgets/unitsContainer.dart';
import 'package:flutter_application_1/classes/language.dart';
import 'package:flutter_application_1/classes/language_constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/customRadio.dart';
import '../../Widgets/formText.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String _selectedValue = '1';
  String categoryValue = '1';
  GoogleMapController? mapController;
  List<Marker> _markers = [];
  bool value = false;
  int? groupValue = 1;
  bool checkbox1 = false;
  bool showmaps = true;
  bool isButtonEnabled = false;
  bool isButtonEnabled1 = false;
  bool isButtonEnabled2 = false;
  int? selectedRadioValue;
  int? selectedRadioValue1;
  int? selectedRadioValue2;
  String trailer = 'Select Type';
  String six = 'Select Type';
  String lorry = 'Select Type';
  String lorry7 = 'Select Type';
  String diana = 'Select Type';
  String pickup = 'Select Type';
  String towtruck = 'Select Type';
  String dropdownValues = 'Load Type';
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();

    if (_markers.isNotEmpty) {
      _markers.add(const Marker(
        markerId: MarkerId("Mylocation"),
        position: LatLng(59.948680, 11.010630),
      ));
      setState(() {
        showmaps = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 720) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(75),
              child: Material(
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(17.w, 0, 17.w, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'naqlilogo.png',
                        height: 75,
                        width: 100,
                      ),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () {
                                // Handle the first button press
                              },
                              child: Text(
                                'User',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Helvetica",
                                  color: Color.fromRGBO(112, 112, 112, 1),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            child: VerticalDivider(
                              color: Color.fromRGBO(206, 203, 203, 1),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle the third button press
                            },
                            child: Text(
                              'Partner',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Helvetica",
                                color: Color.fromRGBO(206, 203, 203, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.notifications,
                            color: Color.fromRGBO(106, 102, 209, 1),
                          ),
                          Text("Contact Us ", style: TabelText.helvetica11),
                          SizedBox(
                            height: 20,
                            child: VerticalDivider(
                              color: Colors.black,
                            ),
                          ),
                          Text("Hello Customer!", style: TabelText.helvetica11),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.fromLTRB(4.w, 4.h, 4.w, 4.h),
              child: Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(4.w, 8.h, 3.w, 8.h),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          Color.fromARGB(255, 216, 214, 214).withOpacity(0.2),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 199, 198, 198).withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 5,
                        offset: Offset(0, 0.5), // Bottom side shadow
                      ),
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
                        blurRadius: 1,
                        spreadRadius: 0, // Bottom side shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromRGBO(245, 243, 255, 1).withOpacity(0.8),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 1000,
                      height: 700,
                      padding: EdgeInsets.fromLTRB(1.w, 2.h, 1.w, 2.h),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 216, 214, 214)
                              .withOpacity(0.2),
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Color.fromARGB(255, 199, 198, 198)
                                .withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 10,
                            offset: Offset(0, 0.5), // Bottom side shadow
                          ),
                          BoxShadow(
                            color: Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.2),
                            blurRadius: 1,
                            spreadRadius: 0, // Bottom side shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Container(
                          height: 605,
                          padding: EdgeInsets.fromLTRB(1.w, 1.h, 1.w, 1.h),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 1.w, 0),
                                child: Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'Group1787.png',
                                            width: 62,
                                            height: 61,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Booking Id #1345789345",
                                            style: TabelText.helveticablack16,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 404,
                                        width: 456,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: GoogleMap(
                                            onMapCreated: (controller) {
                                              setState(() {
                                                mapController = controller;
                                              });
                                            },
                                            markers: Set<Marker>.of(_markers),
                                            mapType: MapType.normal,
                                            initialCameraPosition:
                                                CameraPosition(
                                                    target: LatLng(
                                                        24.755562, 46.589584),
                                                    zoom: 13)),
                                      ),
                                      Container(
                                        width: 20.w,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  "Pick up truck",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontFamily: "Helvetica",
                                                      color: Color.fromRGBO(
                                                          16, 3, 3, 1)),
                                                ),
                                                Text(
                                                  "Toyota Hilux",
                                                  style: TabelText.tableText5,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 63,
                                              child: VerticalDivider(
                                                color: Color.fromRGBO(
                                                    204, 195, 195, 1),
                                                thickness: 2,
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Load",
                                                  style: TabelText.tableText5,
                                                ),
                                                Text(
                                                  "Woods",
                                                  style: TabelText.tableText5,
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Size",
                                                  style: TabelText.tableText5,
                                                ),
                                                Text(
                                                  " 1 to 1.5",
                                                  style: TabelText.tableText5,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                color: Color.fromRGBO(204, 195, 195, 1),
                                thickness: 2,
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(2.w, 2.h, 1.w, 2.h),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomRadio1(
                                          onChanged: (val) {
                                            setState(() {
                                              selectedRadioValue =
                                                  val; // Unselect if already selected
                                              isButtonEnabled = true;
                                            });
                                          },
                                          groupValue: selectedRadioValue,
                                          value: 1,
                                          text1: 'Vendor 1',
                                          colors: Colors.white,
                                          textcolor1: Colors.black54,
                                          text2: "XXXX SAR",
                                          textcolor2: Colors.black38),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CustomRadio1(
                                          onChanged: (val) {
                                            setState(() {
                                              selectedRadioValue =
                                                  val; // Unselect if already selected
                                              isButtonEnabled = true;
                                            });
                                          },
                                          groupValue: selectedRadioValue,
                                          value: 2,
                                          text1: 'Vendor 2',
                                          colors: Colors.white,
                                          textcolor1: Colors.black54,
                                          text2: "XXXX SAR",
                                          textcolor2: Colors.black38),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CustomRadio1(
                                          onChanged: (val) {
                                            setState(() {
                                              selectedRadioValue =
                                                  val; // Unselect if already selected
                                              isButtonEnabled = true;
                                            });
                                          },
                                          groupValue: selectedRadioValue,
                                          value: 3,
                                          text1: 'Vendor 3',
                                          colors: Colors.white,
                                          textcolor1: Colors.black54,
                                          text2: "XXXX SAR",
                                          textcolor2: Colors.black38),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Row(
                                        children: [
                                          Text("Cancel Request",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      145, 79, 157, 1),
                                                  fontFamily: 'Helvetica',
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 170,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomButton(
                                            onPressed: () {},
                                            text: 'Pay Advance: XXXX',
                                          ),
                                          CustomButton(
                                            onPressed: () {
                                              showDialog(
                                                barrierColor: Colors.grey
                                                    .withOpacity(0.5),
                                                context: context,
                                                builder: (context) {
                                                  return BookingConfirmDialog();
                                                },
                                              );
                                            },
                                            text: 'Pay: XXXX',
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(65),
                child: Material(
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.w, 0, 8.w, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PopupMenuButton<String>(
                          icon: Icon(Icons.menu),
                          onSelected: (String value) {
                            setState(() {
                              _selectedValue = value;
                            });
                          },
                          itemBuilder: (BuildContext context) => [
                            PopupMenuItem(
                              value: '1',
                              child: Text('User', style: TabelText.tableText),
                            ),
                            PopupMenuItem(
                              value: '2',
                              child:
                                  Text('Partner', style: TabelText.tableText),
                            ),
                            PopupMenuItem(
                              value: '3',
                              child: Text("Contact Us",
                                  style: TabelText.tableText),
                            ),
                          ],
                        ),
                        Image.asset(
                          'Naqli-final-logo.png',
                          width: 25.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Hello ", style: TabelText.helvetica11),
                            Text("Customer!", style: TabelText.usertext),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Column(
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(
                                  height: 500,
                                ),
                                items: [
                                  Container(
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: AssetImage('truckslide.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: AssetImage('truckslide.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 450, right: 200, top: 200),
                                child: Container(
                                  height: 750,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 400,
                                padding: EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1.0),
                                  color: Color.fromARGB(255, 232, 229,
                                      240), // Set the background color
                                ),
                              ),
                              Container(
                                height: 50,
                                color: Color.fromRGBO(13, 13, 255, 1),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 350,
                            right: 7,
                            left: 7,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: 450,
                                    height: 700,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 232, 229, 240),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: ListView(
                                      // Use ListView instead of Column
                                      shrinkWrap: true,
                                      children: [
                                        SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              // Dropdown text field with location icon
                                              SizedBox(width: 10),
                                              // Vertical divider
                                              SizedBox(width: 10),
                                              // Location text
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 1.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons
                                                          .location_on_outlined),
                                                      SizedBox(width: 5),
                                                      Container(
                                                        height: 30,
                                                        width: 1,
                                                        color: Colors.black,
                                                      ),
                                                      SizedBox(width: 5),
                                                      // Replace the below DropdownButton with your actual dropdown widget
                                                      DropdownButtonHideUnderline(
                                                        child: DropdownButton<
                                                            String>(
                                                          value: 'Location',
                                                          onChanged: (String?
                                                              newValue) {
                                                            // Handle dropdown value change
                                                          },
                                                          items: <String>[
                                                            'Location',
                                                            'Location1',
                                                            'Location2'
                                                          ].map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                            (String value) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value: value,
                                                                child: Text(
                                                                  value,
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Colfax',
                                                                      fontSize:
                                                                          16),
                                                                ),
                                                              );
                                                            },
                                                          ).toList(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 145,
                                                  height: 180,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: Colors
                                                          .black, // Change border color as needed
                                                      width:
                                                          2.0, // Increase border width
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Divider(
                                                          color: Colors.black,
                                                        ),
                                                        SizedBox(height: 2),
                                                        Text(
                                                          'Vehicle',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Colfax',
                                                              fontSize: 14),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 25,
                                                ),
                                                Container(
                                                  width: 145,
                                                  height: 180,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: Colors
                                                          .black, // Change border color as needed
                                                      width:
                                                          2.0, // Increase border width
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Divider(
                                                          color: Colors.black,
                                                        ),
                                                        SizedBox(height: 2),
                                                        Text(
                                                          'Bus',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Colfax',
                                                              fontSize: 14),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 25),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 145,
                                                    height: 180,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color: Colors
                                                            .black, // Change border color as needed
                                                        width:
                                                            2.0, // Increase border width
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Divider(
                                                            color: Colors.black,
                                                          ),
                                                          SizedBox(height: 2),
                                                          Text(
                                                            'Equipment-2',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Colfax',
                                                                fontSize: 14),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 25,
                                                  ),
                                                  Container(
                                                    width: 145,
                                                    height: 180,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color: Colors
                                                            .black, // Change border color as needed
                                                        width:
                                                            2.0, // Increase border width
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Divider(
                                                            color: Colors.black,
                                                          ),
                                                          SizedBox(height: 2),
                                                          Text(
                                                            'Special',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Colfax',
                                                                fontSize: 14),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                            SizedBox(height: 25),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 150,
                                                    height: 180,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color: Colors
                                                            .black, // Change border color as needed
                                                        width:
                                                            2.0, // Increase border width
                                                      ),
                                                      color: Color.fromRGBO(
                                                          106,
                                                          102,
                                                          209,
                                                          1), // RGB color fill
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "Get an Estimate",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      'Colfax',
                                                                  fontSize: 14
                                                                  // Add other text style properties as needed
                                                                  ),
                                                            ),
                                                            SizedBox(
                                                                height: 20),
                                                            Image.asset(
                                                              'right-arrow.png',
                                                              width: 30,
                                                              height: 30,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ])
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 30),
                                            child: Image.asset(
                                              'Rectangle.png', // Replace with your image path
                                              width: 65,
                                              height: 120,
                                              color: Colors.grey,
                                            ),
                                          ),

                                          SizedBox(
                                              width:
                                                  5), // Adjust this space as needed
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Naqli For Individuals",
                                                style: TextStyle(
                                                  fontFamily: 'Colfax',
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              SizedBox(
                                                height: 112,
                                                width: 250,
                                                child: Text(
                                                  "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad mini veniam  quis nostrud exercitation ullamco laboris nisi ut aliquip ex eacommodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum..",
                                                  style: TextStyle(
                                                      fontFamily: 'Colfax',
                                                      fontSize: 8),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      // Repeat the above structure for other rows without unnecessary SizedBox
                                      SizedBox(height: 2),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 30),
                                            child: Image.asset(
                                              'Rectangle.png', // Replace with your image path
                                              width: 65,
                                              height: 110,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(
                                              width:
                                                  5), // Adjust this space as needed
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Naqli For Business",
                                                style: TextStyle(
                                                  fontFamily: 'Colfax',
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              SizedBox(
                                                height: 112,
                                                width: 250,
                                                child: Text(
                                                  "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad mini veniam  quis nostrud exercitation ullamco laboris nisi ut aliquip ex eacommodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum..",
                                                  style: TextStyle(
                                                      fontFamily: 'Colfax',
                                                      fontSize: 8),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 30),
                                            child: Image.asset(
                                              'Rectangle.png', // Replace with your image path
                                              width: 65,
                                              height: 110,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(
                                              width:
                                                  5), // Adjust this space as needed
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Naqli For Partner",
                                                style: TextStyle(
                                                  fontFamily: 'Colfax',
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              SizedBox(
                                                height: 112,
                                                width: 250,
                                                child: Text(
                                                  "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad mini veniam  quis nostrud exercitation ullamco laboris nisi ut aliquip ex eacommodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum..",
                                                  style: TextStyle(
                                                      fontFamily: 'Colfax',
                                                      fontSize: 8),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // First Column - Image

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'Phone.png', // Replace with your image path
                                              width: 160,
                                              height: 160,
                                            ),
                                          ],
                                        ),

                                        // Second Column - Text
                                        SizedBox(height: 10),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'How to get Naqli in Action',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Colfax',
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),

                                        // Third Column - Text
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Lorem ipsum dolor sit amet,\n"
                                              "consectetur adipiscing elit, sed\n"
                                              "do eiusmod tempor incididunt ut\n"
                                              "labore et dolore magna aliqua.\n"
                                              "Ut enim ad minim veniam, quis\n"
                                              "nostrud exercitation ullamco\n"
                                              "laboris nisi ut aliquip ex ea\n"
                                              "commodo consequat. Duis aute\n"
                                              "irure dolor in",
                                              style: TextStyle(
                                                fontFamily: 'Colfax',
                                                fontSize: 10,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        }
      });
    });
  }
}
