// ignore_for_file: dead_code

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/DialogBox/SingleTimeUser/bookingIDDialog.dart';
import 'package:flutter_application_1/Users/SingleTimeUser/bookingDetails.dart';
import 'package:flutter_application_1/Widgets/customButton.dart';
import 'package:flutter_application_1/Widgets/customTextField.dart';
import 'package:flutter_application_1/Widgets/unitsContainer.dart';
import 'package:flutter_application_1/classes/language.dart';
import 'package:flutter_application_1/classes/language_constants.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/formText.dart';

class AvailableUnits extends StatefulWidget {
  const AvailableUnits({
    Key? key,
  }) : super(key: key);

  @override
  State<AvailableUnits> createState() => _AvailableUnitsState();
}

class _AvailableUnitsState extends State<AvailableUnits> {
  String _selectedValue = '1';
  String categoryValue = '1';
  bool value = false;
  int? groupValue = 1;
  bool checkbox1 = false;
  final ScrollController _Scroll1 = ScrollController();
  final ScrollController _Scroll2 = ScrollController();
  String trailer = 'Select Type';
  String six = 'Select Type';
  String lorry = 'Select Type';
  String lorry7 = 'Select Type';
  String diana = 'Select Type';
  String pickup = 'Select Type';
  String towtruck = 'Select Type';
  String dropdownValues = 'Load Type';
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 1350) {
          return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(90),
                child: Material(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(13.w, 0, 15.w, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 12, bottom: 6),
                          child: Image.asset(
                            'naqlilogo.png',
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                // Handle the first button press
                              },
                              child: Text(
                                'User',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "HelveticaNeueRegular",
                                  color: Color.fromRGBO(112, 112, 112, 1),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              child: VerticalDivider(
                                thickness: 2,
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
                                  fontFamily: "HelveticaNeueRegular",
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
                            SizedBox(
                              width: 0.1.w,
                            ),
                            Text("Contact Us ",
                                style: HomepageText.helvetica16black),
                            SizedBox(
                              height: 30,
                              child: VerticalDivider(
                                color: Colors.black,
                              ),
                            ),
                            Text("Hello Customer!",
                                style: HomepageText.helvetica16black),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              viewportFraction: 1.0,
                              autoPlayAnimationDuration: Durations.extralong4,
                              height: 500,
                            ),
                            items: [
                              Image(
                                width: double.infinity,
                                fit: BoxFit.cover,
                                image: AssetImage('truckslide.jpg'),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 450, right: 200, top: 200),
                          ),
                          SizedBox(
                            height: 150,
                          ),
                        ],
                      ),
                      Positioned(
                        left: 19.w,
                        right: 19.w,
                        top: 8.h,
                        child: Scrollbar(
                          controller: _Scroll1,
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                            controller: _Scroll1,
                            scrollDirection: Axis.vertical,
                            child: Card(
                              elevation: 3,
                              shadowColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(31))),
                              child: Container(
                                padding:
                                    EdgeInsets.fromLTRB(2.w, 6.h, 2.w, 3.h),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                height: 740,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 1.5.w, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            UnitsContainer(
                                              text: 'Tralia',
                                              items: <String>[
                                                'Select Type',
                                                'Short Sides',
                                                'Contract',
                                                'None'
                                              ],
                                              value: trailer,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  trailer =
                                                      newValue!; // Update value in the list
                                                });
                                              },
                                            ),
                                            UnitsContainer(
                                              text: 'Six',
                                              items: <String>[
                                                'Select Type',
                                                'Short Sides',
                                                'Contract',
                                                'None'
                                              ],
                                              value: six,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  six =
                                                      newValue!; // Update value in the list
                                                });
                                              },
                                            ),
                                            UnitsContainer(
                                              text: 'Lorry 7 Metres',
                                              items: <String>[
                                                'Select Type',
                                                'Short Sides',
                                                'Contract',
                                                'None'
                                              ],
                                              value: lorry7,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  lorry =
                                                      newValue!; // Update value in the list
                                                });
                                              },
                                            ),
                                            UnitsContainer(
                                              text: 'Lorry',
                                              items: <String>[
                                                'Select Type',
                                                'Short Sides',
                                                'Contract',
                                                'None'
                                              ],
                                              value: lorry,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  lorry =
                                                      newValue!; // Update value in the list
                                                });
                                              },
                                            ),
                                            UnitsContainer(
                                              text: 'Diana',
                                              items: <String>[
                                                'Select Type',
                                                'Short Sides',
                                                'Contract',
                                                'None'
                                              ],
                                              value: diana,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  diana =
                                                      newValue!; // Update value in the list
                                                });
                                              },
                                            ),
                                            UnitsContainer(
                                              text: 'Pick Up',
                                              items: <String>[
                                                'Select Type',
                                                'Short Sides',
                                                'Contract',
                                                'None'
                                              ],
                                              value: pickup,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  pickup =
                                                      newValue!; // Update value in the list
                                                });
                                              },
                                            ),
                                            UnitsContainer(
                                              text: 'Tow Truck',
                                              items: <String>[
                                                'Select Type',
                                                'Short Sides',
                                                'Contract',
                                                'None'
                                              ],
                                              value: towtruck,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  towtruck =
                                                      newValue!; // Update value in the list
                                                });
                                              },
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Flexible(
                                                            child:
                                                                CustomTextfieldGrey(
                                                              text: 'Time',
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Flexible(
                                                            child:
                                                                CustomTextfieldGrey(
                                                              text:
                                                                  'Value of the Product',
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0.5.w,
                                                                0,
                                                                1.w,
                                                                0),
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      183,
                                                                      183,
                                                                      183,
                                                                      1)),
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    8),
                                                            topRight:
                                                                Radius.circular(
                                                                    8),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    8),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .calendar_today,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        183,
                                                                        183,
                                                                        183,
                                                                        1)),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            VerticalDivider(
                                                              width: 0.2,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      183,
                                                                      183,
                                                                      183,
                                                                      1),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      DropdownButtonHideUnderline(
                                                        child: DropdownButton2<
                                                            String>(
                                                          value:
                                                              dropdownValues, // Use value from the list
                                                          items: <String>[
                                                            'Trigger Bookings',
                                                            'Booking Manager',
                                                            'Contract',
                                                            'Load Type',
                                                            'None'
                                                          ].map<
                                                              DropdownMenuItem<
                                                                  String>>((String
                                                              value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              value: value,
                                                              child: Text(value,
                                                                  style: AvailableText
                                                                      .helvetica),
                                                            );
                                                          }).toList(),
                                                          onChanged: (String?
                                                              newValue) {
                                                            setState(() {
                                                              dropdownValues =
                                                                  newValue!; // Update value in the list
                                                            });
                                                          },
                                                          buttonStyleData:
                                                              ButtonStyleData(
                                                            height: 50,
                                                            width: 15.w,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 9,
                                                                    right: 5),
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          183,
                                                                          183,
                                                                          183,
                                                                          1)),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          iconStyleData:
                                                              const IconStyleData(
                                                            icon: Icon(
                                                              Icons
                                                                  .arrow_drop_down_sharp,
                                                            ),
                                                            iconSize: 25,
                                                            iconEnabledColor:
                                                                Colors.black,
                                                            iconDisabledColor:
                                                                null,
                                                          ),
                                                          dropdownStyleData:
                                                              DropdownStyleData(
                                                            elevation: 0,
                                                            maxHeight: 200,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    3),
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          112,
                                                                          112,
                                                                          112,
                                                                          1)),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        5),
                                                                topRight: Radius
                                                                    .circular(
                                                                        5),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        5),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            scrollPadding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            scrollbarTheme:
                                                                ScrollbarThemeData(
                                                              thickness:
                                                                  MaterialStateProperty
                                                                      .all<double>(
                                                                          6),
                                                              thumbVisibility:
                                                                  MaterialStateProperty
                                                                      .all<bool>(
                                                                          true),
                                                            ),
                                                          ),
                                                          menuItemStyleData:
                                                              MenuItemStyleData(
                                                            height: 30,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 9,
                                                                    right: 5),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Checkbox(
                                                  value: checkbox1,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      value = newValue!;
                                                    });
                                                  },
                                                ),
                                                Text('Need Additional Labour',
                                                    style: AvailableText
                                                        .helveticablack),
                                                Transform.scale(
                                                  scale: 0.7,
                                                  child: Radio<int?>(
                                                      splashRadius: 5,
                                                      fillColor:
                                                          MaterialStateProperty
                                                              .resolveWith(
                                                                  (states) {
                                                        if (states.contains(
                                                            MaterialState
                                                                .selected)) {
                                                          return Color.fromRGBO(
                                                              183, 183, 183, 1);
                                                        }
                                                        return Color.fromRGBO(
                                                            208, 205, 205, 1);
                                                      }),
                                                      hoverColor:
                                                          Color.fromRGBO(183,
                                                                  183, 183, 1)
                                                              .withOpacity(.8),
                                                      value: 1,
                                                      groupValue: groupValue,
                                                      onChanged: (int? value) {
                                                        setState(() {
                                                          groupValue = value;
                                                        });
                                                      }),
                                                ),
                                                Text('1',
                                                    style: AvailableText
                                                        .helveticablack),
                                                Transform.scale(
                                                  scale: 0.7,
                                                  child: Radio<int?>(
                                                      splashRadius: 5,
                                                      fillColor:
                                                          MaterialStateProperty
                                                              .resolveWith(
                                                                  (states) {
                                                        if (states.contains(
                                                            MaterialState
                                                                .selected)) {
                                                          return Color.fromRGBO(
                                                              183, 183, 183, 1);
                                                        }
                                                        return Color.fromRGBO(
                                                            208, 205, 205, 1);
                                                      }),
                                                      hoverColor:
                                                          Color.fromRGBO(183,
                                                                  183, 183, 1)
                                                              .withOpacity(.8),
                                                      value: 2,
                                                      groupValue: groupValue,
                                                      onChanged: (int? value) {
                                                        setState(() {
                                                          groupValue = value;
                                                        });
                                                      }),
                                                ),
                                                Text('2',
                                                    style: AvailableText
                                                        .helveticablack),
                                                Transform.scale(
                                                  scale: 0.7,
                                                  child: Radio<int?>(
                                                      splashRadius: 5,
                                                      fillColor:
                                                          MaterialStateProperty
                                                              .resolveWith(
                                                                  (states) {
                                                        if (states.contains(
                                                            MaterialState
                                                                .selected)) {
                                                          return Color.fromRGBO(
                                                              183, 183, 183, 1);
                                                        }
                                                        return Color.fromRGBO(
                                                            208, 205, 205, 1);
                                                      }),
                                                      hoverColor:
                                                          Color.fromRGBO(183,
                                                                  183, 183, 1)
                                                              .withOpacity(.8),
                                                      value: 3,
                                                      groupValue: groupValue,
                                                      onChanged: (int? value) {
                                                        setState(() {
                                                          groupValue = value;
                                                        });
                                                      }),
                                                ),
                                                Text('3',
                                                    style: AvailableText
                                                        .helveticablack),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    VerticalDivider(
                                      color: Color.fromRGBO(183, 183, 183, 1),
                                      width: 1,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(1.5.w, 0, 0, 0),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Color.fromRGBO(
                                                          183,
                                                          183,
                                                          183,
                                                          1) // Specify the border width
                                                      ),
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(8),
                                                  )),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.circle,
                                                        color: Colors.green,
                                                        size: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        'Pick Up',
                                                        style: AvailableText
                                                            .helvetica17grey,
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                      color: Color.fromRGBO(
                                                          183, 183, 183, 1)),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.circle,
                                                        color: Colors.red,
                                                        size: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        'Drop Point A',
                                                        style: AvailableText
                                                            .helvetica17grey,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 200,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Color.fromRGBO(
                                                            183,
                                                            183,
                                                            183,
                                                            1) // Specify the border width
                                                        ),
                                                    color: Color.fromARGB(
                                                        69, 112, 106, 106),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(8),
                                                    )),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              height: 47,
                                              child: CustomButton(
                                                onPressed: () {
                                                  showDialog(
                                                    barrierColor:
                                                        Color.fromRGBO(
                                                                59, 57, 57, 1)
                                                            .withOpacity(0.5),
                                                    context: context,
                                                    builder: (context) {
                                                      return BookingIDDialog();
                                                    },
                                                  );
                                                },
                                                text: 'Create Booking',
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
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
                          'naqlilogo.png',
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
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              viewportFraction: 1.0,
                              autoPlayAnimationDuration: Durations.extralong4,
                              height: 500,
                            ),
                            items: [
                              Image(
                                width: double.infinity,
                                fit: BoxFit.cover,
                                image: AssetImage('truckslide.jpg'),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 450, right: 200, top: 200),
                          ),
                          SizedBox(
                            height: 150,
                          ),
                        ],
                      ),
                      Positioned(
                        left: 10.w,
                        right: 10.w,
                        top: 8.h,
                        child: Scrollbar(
                          controller: _Scroll1,
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                            controller: _Scroll1,
                            scrollDirection: Axis.vertical,
                            child: Card(
                              elevation: 3,
                              shadowColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(31))),
                              child: Container(
                                padding:
                                    EdgeInsets.fromLTRB(2.w, 6.h, 2.w, 3.h),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                height: 740,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 1.5.w, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            UnitsContainer(
                                              text: 'Tralia',
                                              items: <String>[
                                                'Select Type',
                                                'Short Sides',
                                                'Contract',
                                                'None'
                                              ],
                                              value: trailer,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  trailer =
                                                      newValue!; // Update value in the list
                                                });
                                              },
                                            ),
                                            UnitsContainer(
                                              text: 'Six',
                                              items: <String>[
                                                'Select Type',
                                                'Short Sides',
                                                'Contract',
                                                'None'
                                              ],
                                              value: six,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  six =
                                                      newValue!; // Update value in the list
                                                });
                                              },
                                            ),
                                            UnitsContainer(
                                              text: 'Lorry 7 Metres',
                                              items: <String>[
                                                'Select Type',
                                                'Short Sides',
                                                'Contract',
                                                'None'
                                              ],
                                              value: lorry7,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  lorry =
                                                      newValue!; // Update value in the list
                                                });
                                              },
                                            ),
                                            UnitsContainer(
                                              text: 'Lorry',
                                              items: <String>[
                                                'Select Type',
                                                'Short Sides',
                                                'Contract',
                                                'None'
                                              ],
                                              value: lorry,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  lorry =
                                                      newValue!; // Update value in the list
                                                });
                                              },
                                            ),
                                            UnitsContainer(
                                              text: 'Diana',
                                              items: <String>[
                                                'Select Type',
                                                'Short Sides',
                                                'Contract',
                                                'None'
                                              ],
                                              value: diana,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  diana =
                                                      newValue!; // Update value in the list
                                                });
                                              },
                                            ),
                                            UnitsContainer(
                                              text: 'Pick Up',
                                              items: <String>[
                                                'Select Type',
                                                'Short Sides',
                                                'Contract',
                                                'None'
                                              ],
                                              value: pickup,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  pickup =
                                                      newValue!; // Update value in the list
                                                });
                                              },
                                            ),
                                            UnitsContainer(
                                              text: 'Tow Truck',
                                              items: <String>[
                                                'Select Type',
                                                'Short Sides',
                                                'Contract',
                                                'None'
                                              ],
                                              value: towtruck,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  towtruck =
                                                      newValue!; // Update value in the list
                                                });
                                              },
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Flexible(
                                                            child:
                                                                CustomTextfieldGrey(
                                                              text: 'Time',
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Flexible(
                                                            child:
                                                                CustomTextfieldGrey(
                                                              text:
                                                                  'Value of the Product',
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0.5.w,
                                                                0,
                                                                1.w,
                                                                0),
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      183,
                                                                      183,
                                                                      183,
                                                                      1)),
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    8),
                                                            topRight:
                                                                Radius.circular(
                                                                    8),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    8),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .calendar_today,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        183,
                                                                        183,
                                                                        183,
                                                                        1)),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            VerticalDivider(
                                                              width: 0.2,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      183,
                                                                      183,
                                                                      183,
                                                                      1),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      DropdownButtonHideUnderline(
                                                        child: DropdownButton2<
                                                            String>(
                                                          value:
                                                              dropdownValues, // Use value from the list
                                                          items: <String>[
                                                            'Trigger Bookings',
                                                            'Booking Manager',
                                                            'Contract',
                                                            'Load Type',
                                                            'None'
                                                          ].map<
                                                              DropdownMenuItem<
                                                                  String>>((String
                                                              value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              value: value,
                                                              child: Text(value,
                                                                  style: AvailableText
                                                                      .helvetica),
                                                            );
                                                          }).toList(),
                                                          onChanged: (String?
                                                              newValue) {
                                                            setState(() {
                                                              dropdownValues =
                                                                  newValue!; // Update value in the list
                                                            });
                                                          },
                                                          buttonStyleData:
                                                              ButtonStyleData(
                                                            height: 50,
                                                            width: 15.w,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 9,
                                                                    right: 5),
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          183,
                                                                          183,
                                                                          183,
                                                                          1)),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          iconStyleData:
                                                              const IconStyleData(
                                                            icon: Icon(
                                                              Icons
                                                                  .arrow_drop_down_sharp,
                                                            ),
                                                            iconSize: 25,
                                                            iconEnabledColor:
                                                                Colors.black,
                                                            iconDisabledColor:
                                                                null,
                                                          ),
                                                          dropdownStyleData:
                                                              DropdownStyleData(
                                                            elevation: 0,
                                                            maxHeight: 200,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    3),
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          112,
                                                                          112,
                                                                          112,
                                                                          1)),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        5),
                                                                topRight: Radius
                                                                    .circular(
                                                                        5),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        5),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            scrollPadding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            scrollbarTheme:
                                                                ScrollbarThemeData(
                                                              thickness:
                                                                  MaterialStateProperty
                                                                      .all<double>(
                                                                          6),
                                                              thumbVisibility:
                                                                  MaterialStateProperty
                                                                      .all<bool>(
                                                                          true),
                                                            ),
                                                          ),
                                                          menuItemStyleData:
                                                              MenuItemStyleData(
                                                            height: 30,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 9,
                                                                    right: 5),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Checkbox(
                                                  value: checkbox1,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      value = newValue!;
                                                    });
                                                  },
                                                ),
                                                Text('Need Additional Labour',
                                                    style: AvailableText
                                                        .helvetica),
                                                Transform.scale(
                                                  scale: 0.7,
                                                  child: Radio<int?>(
                                                      splashRadius: 5,
                                                      fillColor:
                                                          MaterialStateProperty
                                                              .resolveWith(
                                                                  (states) {
                                                        if (states.contains(
                                                            MaterialState
                                                                .selected)) {
                                                          return Color.fromRGBO(
                                                              183, 183, 183, 1);
                                                        }
                                                        return Color.fromRGBO(
                                                            208, 205, 205, 1);
                                                      }),
                                                      hoverColor:
                                                          Color.fromRGBO(183,
                                                                  183, 183, 1)
                                                              .withOpacity(.8),
                                                      value: 1,
                                                      groupValue: groupValue,
                                                      onChanged: (int? value) {
                                                        setState(() {
                                                          groupValue = value;
                                                        });
                                                      }),
                                                ),
                                                Text('1',
                                                    style: AvailableText
                                                        .helveticablack),
                                                Transform.scale(
                                                  scale: 0.7,
                                                  child: Radio<int?>(
                                                      splashRadius: 5,
                                                      fillColor:
                                                          MaterialStateProperty
                                                              .resolveWith(
                                                                  (states) {
                                                        if (states.contains(
                                                            MaterialState
                                                                .selected)) {
                                                          return Color.fromRGBO(
                                                              183, 183, 183, 1);
                                                        }
                                                        return Color.fromRGBO(
                                                            208, 205, 205, 1);
                                                      }),
                                                      hoverColor:
                                                          Color.fromRGBO(183,
                                                                  183, 183, 1)
                                                              .withOpacity(.8),
                                                      value: 2,
                                                      groupValue: groupValue,
                                                      onChanged: (int? value) {
                                                        setState(() {
                                                          groupValue = value;
                                                        });
                                                      }),
                                                ),
                                                Text('2',
                                                    style: AvailableText
                                                        .helveticablack),
                                                Transform.scale(
                                                  scale: 0.7,
                                                  child: Radio<int?>(
                                                      splashRadius: 5,
                                                      fillColor:
                                                          MaterialStateProperty
                                                              .resolveWith(
                                                                  (states) {
                                                        if (states.contains(
                                                            MaterialState
                                                                .selected)) {
                                                          return Color.fromRGBO(
                                                              183, 183, 183, 1);
                                                        }
                                                        return Color.fromRGBO(
                                                            208, 205, 205, 1);
                                                      }),
                                                      hoverColor:
                                                          Color.fromRGBO(183,
                                                                  183, 183, 1)
                                                              .withOpacity(.8),
                                                      value: 3,
                                                      groupValue: groupValue,
                                                      onChanged: (int? value) {
                                                        setState(() {
                                                          groupValue = value;
                                                        });
                                                      }),
                                                ),
                                                Text('3',
                                                    style: AvailableText
                                                        .helveticablack),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    VerticalDivider(
                                      color: Color.fromRGBO(183, 183, 183, 1),
                                      width: 1,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(1.5.w, 0, 0, 0),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Color.fromRGBO(
                                                          183,
                                                          183,
                                                          183,
                                                          1) // Specify the border width
                                                      ),
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(8),
                                                  )),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.circle,
                                                        color: Colors.green,
                                                        size: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        'Pick Up',
                                                        style: AvailableText
                                                            .helvetica17grey,
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                      color: Color.fromRGBO(
                                                          183, 183, 183, 1)),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.circle,
                                                        color: Colors.red,
                                                        size: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        'Drop Point A',
                                                        style: AvailableText
                                                            .helvetica17grey,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 200,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Color.fromRGBO(
                                                            183,
                                                            183,
                                                            183,
                                                            1) // Specify the border width
                                                        ),
                                                    color: Color.fromARGB(
                                                        69, 112, 106, 106),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(8),
                                                    )),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              height: 47,
                                              child: CustomButton(
                                                onPressed: () {
                                                  showDialog(
                                                    barrierColor:
                                                        Color.fromRGBO(
                                                                59, 57, 57, 1)
                                                            .withOpacity(0.5),
                                                    context: context,
                                                    builder: (context) {
                                                      return BookingIDDialog();
                                                    },
                                                  );
                                                },
                                                text: 'Create Booking',
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
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
