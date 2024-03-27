import 'dart:ui';

import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Widgets/colorContainer.dart';
import 'package:flutter_application_1/Widgets/formText.dart';
import 'package:flutter_application_1/pieChart/app_colors.dart';
import 'package:flutter_application_1/pieChart/indicator.dart';
import 'package:flutter_application_1/Widgets/customButton.dart';
import 'package:flutter_application_1/echarts_data.dart';
import 'package:graphic/graphic.dart';
import 'package:sizer/sizer.dart';
import 'dart:ui';

class BookingHistroy extends StatefulWidget {
  BookingHistroy();
  @override
  State<BookingHistroy> createState() => _BookingHistroyState();
}

class _BookingHistroyState extends State<BookingHistroy> {
  PageController page = PageController();
  SideMenuController sideMenu = SideMenuController();
  ScrollController _scrollController = ScrollController();

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
    super.initState();
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
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(75, 61, 82, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 80, top: 20),
                          child: Text(
                            'Booking History',
                            style: TextStyle(
                              fontSize: 33,
                              fontFamily: 'Helvetica',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100),
                Center(
                  child: Container(
                    //width:300; // Set width to match screen width
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Color.fromRGBO(112, 112, 112, 1),
                            width: 0.5),
                        left: BorderSide(
                            color: Color.fromRGBO(112, 112, 112, 1),
                            width: 0.5),
                        right: BorderSide(
                            color: Color.fromRGBO(112, 112, 112, 1),
                            width: 0.5),
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Scrollbar(
                      controller: _scrollController,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: _scrollController,
                        child: SizedBox(
                          width: 1100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: DataTable(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromRGBO(112, 112, 112, 1),
                                      width: 0.5),
                                  left: BorderSide(
                                      color: Color.fromRGBO(112, 112, 112, 1),
                                      width: 0.5),
                                  right: BorderSide(
                                      color: Color.fromRGBO(112, 112, 112, 1),
                                      width: 0.5),
                                ),
                              ),
                              headingRowColor: MaterialStateColor.resolveWith(
                                  (states) => Color.fromRGBO(75, 61, 82, 1)),
                              dataRowColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.white),
                              dividerThickness: 1.0,
                              dataRowHeight: 65,
                              headingRowHeight: 75,
                              columns: <DataColumn>[
                                DataColumn(
                                    label: Expanded(
                                        child: Text(
                                  'Mode',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'SFproText'),
                                  textAlign: TextAlign.center,
                                ))),
                                DataColumn(
                                    label: Expanded(
                                        child: Text(
                                  'Booking ID',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'SFproText'),
                                  textAlign: TextAlign.center,
                                ))),
                                DataColumn(
                                    label: Expanded(
                                        child: Text(
                                  'Date',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'SFproText'),
                                  textAlign: TextAlign.center,
                                ))),
                                DataColumn(
                                    label: Expanded(
                                        child: Text(
                                  'Unit Type',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'SFproText'),
                                  textAlign: TextAlign.center,
                                ))),
                                DataColumn(
                                    label: Expanded(
                                        child: Text(
                                  'Payment',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'SFproText'),
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
                                      'XXXX SAR'
                                    ])
                                      DataCell(
                                        Container(
                                          height: 65, // Adjust height as needed
                                          alignment: Alignment.center,
                                          child: Text(item,
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontFamily: 'SFproText',
                                                  color: Color.fromRGBO(
                                                      10, 5, 5, 1))),
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
                                      'XXXX SAR'
                                    ])
                                      DataCell(
                                        Container(
                                          height: 65, // Adjust height as needed
                                          alignment: Alignment.center,
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontFamily: 'SFproText',
                                                color: Color.fromRGBO(
                                                    10, 5, 5, 1)),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    for (var item in [
                                      'Equipment Hire',
                                      '#456789231',
                                      '12.5.2022',
                                      'Crane',
                                      'XXXX SAR'
                                    ])
                                      DataCell(
                                        Container(
                                          height: 65, // Adjust height as needed
                                          alignment: Alignment.center,
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontFamily: 'SFproText',
                                                color: Color.fromRGBO(
                                                    10, 5, 5, 1)),
                                          ),
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
            padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 70, top: 30),
                    child: Text('Booking History',
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Helvetica',
                            color: Color.fromRGBO(162, 157, 157, 1))),
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  //width:300; // Set width to match screen width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromRGBO(199, 199, 199, 1).withOpacity(0.5),
                        blurRadius: 1,
                        spreadRadius: 2,
                        offset: Offset(0, 0.5), // Bottom side shadow
                      ),
                    ],
                  ),
                  child: Scrollbar(
                    controller: _scrollController,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      child: SizedBox(
                        width: 1100,
                        child: DataTable(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(199, 199, 199, 1)
                                    .withOpacity(0.5),
                                blurRadius: 1,
                                spreadRadius: 2,
                                offset: Offset(0, 0.5), // Bottom side shadow
                              ),
                            ],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                          ),
                          headingRowColor: MaterialStateColor.resolveWith(
                              (states) => Color.fromRGBO(75, 61, 82, 1)),
                          dataRowColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white),
                          showBottomBorder: true,
                          dividerThickness: 1.0,
                          dataRowHeight: 65,
                          columns: <DataColumn>[
                            DataColumn(
                                label: Expanded(
                                    child: Text(
                              'Mode',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'SFproText'),
                              textAlign: TextAlign.center,
                            ))),
                            DataColumn(
                                label: Expanded(
                                    child: Text(
                              'Booking Id',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'SFproText'),
                              textAlign: TextAlign.center,
                            ))),
                            DataColumn(
                                label: Expanded(
                                    child: Text(
                              'Date',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'SFproText'),
                              textAlign: TextAlign.center,
                            ))),
                            DataColumn(
                                label: Expanded(
                                    child: Text(
                              'Unit Type',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'SFproText'),
                              textAlign: TextAlign.center,
                            ))),
                            DataColumn(
                                label: Expanded(
                                    child: Text(
                              'Payment',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'SFproText'),
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
                                  'Xxx SAR'
                                ])
                                  DataCell(
                                    Container(
                                      height: 65, // Adjust height as needed
                                      alignment: Alignment.center,
                                      child: Text(item,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'SFproText',
                                              color:
                                                  Color.fromRGBO(10, 5, 5, 1))),
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
                                  'Xxx SAR'
                                ])
                                  DataCell(
                                    Container(
                                      height: 65, // Adjust height as needed
                                      alignment: Alignment.center,
                                      child: Text(item,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'SFproText',
                                              color:
                                                  Color.fromRGBO(10, 5, 5, 1))),
                                    ),
                                  ),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                for (var item in [
                                  'Equipment Hire',
                                  '#456789231',
                                  '12.5.2022',
                                  'Crane',
                                  'Xxx SAR'
                                ])
                                  DataCell(
                                    Container(
                                      height: 65, // Adjust height as needed
                                      alignment: Alignment.center,
                                      child: Text(
                                        item,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'SFproText',
                                            color: Color.fromRGBO(10, 5, 5, 1)),
                                      ),
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
          ));
        }
      });
    });
  }

  DataTable _booking1Table() {
    return DataTable(
        columnSpacing: 15,
        dataRowHeight: 65,
        headingRowHeight: 0,
        columns: _booking1Columns(),
        rows: _booking1Rows());
  }

  List<DataColumn> _booking1Columns() {
    return [
      DataColumn(label: SizedBox(), numeric: true),
    ];
  }

  // List<DataRow> _createRows() {
  //   return _books
  //       .map((book) => DataRow(cells: [
  //             DataCell(Text('#' + book['id'].toString())),
  //             DataCell(Text(book['title'])),
  //             DataCell(Text(book['author']))
  //           ]))
  //       .toList();
  // }
  List<DataRow> _booking1Rows() {
    return [
      DataRow(cells: [
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 35,
                      height: 35,
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(230, 228, 238, 1),
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Trip 1', style: TabelText.text1),
                        SizedBox(height: 3),
                        Text("18.02.2022", style: TabelText.text2),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 60,
                        child: Text('Truck',
                            textAlign: TextAlign.center,
                            style: TabelText.text2)),
                    SizedBox(
                      width: 1.w,
                    ),
                    ViewButton(
                      text: 'View',
                      onPressed: () {},
                      colors: Color.fromRGBO(245, 243, 255, 1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
      DataRow(cells: [
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 35,
                      height: 35,
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(230, 228, 238, 1),
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Equipment Hire', style: TabelText.text1),
                        SizedBox(height: 3),
                        Text("10.02.2022", style: TabelText.text2),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 60,
                        child: Text('Heavy Equipment',
                            textAlign: TextAlign.center,
                            style: TabelText.text2)),
                    SizedBox(
                      width: 1.w,
                    ),
                    ViewButton(
                      text: 'View',
                      onPressed: () {},
                      colors: Color.fromRGBO(245, 243, 255, 1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
      DataRow(cells: [
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 35,
                      height: 35,
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(230, 228, 238, 1),
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Fletch Skinner', style: TabelText.text1),
                        SizedBox(height: 3),
                        Text("07.02.2022", style: TabelText.text2),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 60,
                        child: Text('Trailer',
                            textAlign: TextAlign.center,
                            style: TabelText.text2)),
                    SizedBox(
                      width: 1.w,
                    ),
                    ViewButton(
                      text: 'View',
                      onPressed: () {},
                      colors: Color.fromRGBO(245, 243, 255, 1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    ];
  }

  DataTable _pendingbookTable() {
    return DataTable(
        border: TableBorder(
            verticalInside:
                BorderSide(width: 1, color: Color.fromRGBO(118, 112, 112, 1)),
            right: BorderSide(
                width: 0.5, color: Color.fromRGBO(118, 112, 112, 1))),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white,
            Color.fromRGBO(245, 243, 255, 1),
            Color.fromRGBO(245, 243, 255, 1),
            Color.fromRGBO(245, 243, 255, 1),
          ], stops: [
            0.4,
            0.4,
            0.4,
            0.4
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        columnSpacing: 0,
        dataRowHeight: 65,
        headingRowHeight: 0,
        columns: _pendingbookColumns(),
        dividerThickness: 1,
        rows: _pendingbookRows());
  }

  List<DataColumn> _pendingbookColumns() {
    return [
      DataColumn(label: SizedBox(), numeric: false),
      DataColumn(
          label: SizedBox(
            width: 140,
          ),
          numeric: true),
      DataColumn(
          label: SizedBox(
            width: 140,
          ),
          numeric: true),
      DataColumn(
          label: SizedBox(
            width: 130,
          ),
          numeric: true),
    ];
  }

  // List<DataRow> _createRows() {
  //   return _books
  //       .map((book) => DataRow(cells: [
  //             DataCell(Text('#' + book['id'].toString())),
  //             DataCell(Text(book['title'])),
  //             DataCell(Text(book['author']))
  //           ]))
  //       .toList();
  // }
  List<DataRow> _pendingbookRows() {
    return [
      DataRow(cells: [
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Row(
              children: [
                SizedBox(
                  width: 35,
                  height: 35,
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(230, 228, 238, 1),
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Truck', style: TabelText.text1),
                    SizedBox(height: 3),
                    Text("Booking ID XXXXXX", style: TabelText.text2),
                  ],
                ),
              ],
            ),
          ),
        ),
        DataCell(
          ColorContainer(
            text1: 'Vendor 3',
            text2: 'Xxxxx SAR',
            colors: Color.fromRGBO(200, 251, 253, 1),
          ),
        ),
        DataCell(
          ColorContainer(
            text1: 'Vendor 2',
            text2: 'Xxxxx SAR',
            colors: Color.fromRGBO(224, 253, 200, 1),
          ),
        ),
        DataCell(
          ColorContainer(
            text1: 'Vendor 3',
            text2: 'Xxxxx SAR',
            colors: Color.fromRGBO(245, 253, 200, 1),
          ),
        ),
      ]),
      DataRow(cells: [
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Row(
              children: [
                SizedBox(
                  width: 35,
                  height: 35,
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(230, 228, 238, 1),
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Equipment Hire', style: TabelText.text1),
                    SizedBox(height: 3),
                    Text("Booking ID XXXXXX", style: TabelText.text2),
                  ],
                ),
              ],
            ),
          ),
        ),
        DataCell(
          ColorContainer(
            text1: 'Vendor 3',
            text2: 'Xxxxx SAR',
            colors: Color.fromRGBO(200, 251, 253, 1),
          ),
        ),
        DataCell(
          ColorContainer(
            text1: 'Vendor 2',
            text2: 'Xxxxx SAR',
            colors: Color.fromRGBO(224, 253, 200, 1),
          ),
        ),
        DataCell(
          ColorContainer(
            text1: 'Vendor 3',
            text2: 'Xxxxx SAR',
            colors: Color.fromRGBO(245, 253, 200, 1),
          ),
        ),
      ]),
      DataRow(cells: [
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Row(
              children: [
                SizedBox(
                  width: 35,
                  height: 35,
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(230, 228, 238, 1),
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bus Trip', style: TabelText.text1),
                    SizedBox(height: 3),
                    Text("Booking ID XXXXXX", style: TabelText.text2),
                  ],
                ),
              ],
            ),
          ),
        ),
        DataCell(
          ColorContainer(
            text1: 'Vendor 3',
            text2: 'Xxxxx SAR',
            colors: Color.fromRGBO(200, 251, 253, 1),
          ),
        ),
        DataCell(
          ColorContainer(
            text1: 'Vendor 2',
            text2: 'Xxxxx SAR',
            colors: Color.fromRGBO(224, 253, 200, 1),
          ),
        ),
        DataCell(
          ColorContainer(
            text1: 'Vendor 3',
            text2: 'Xxxxx SAR',
            colors: Color.fromRGBO(245, 253, 200, 1),
          ),
        ),
      ]),
    ];
  }
}
