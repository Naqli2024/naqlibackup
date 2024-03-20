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

class SingleUserPayment extends StatefulWidget {
  SingleUserPayment();
  @override
  State<SingleUserPayment> createState() => _SingleUserPaymentState();
}

class _SingleUserPaymentState extends State<SingleUserPayment> {
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color.fromRGBO(255, 255, 255, 0.925),
            ),
            padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
                  child: Container(
                    width: 1400,
                    height: 100, // Increased height to accommodate button
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              color: Color.fromRGBO(149, 143, 143, 1)),
                        ),
                        Text(
                          'Paid : SAR xxxxx',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'SFProText',
                              color: Color.fromRGBO(149, 143, 143, 1)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Balance',
                              style: TextStyle(
                                  fontSize: 16.0, fontFamily: 'Helvetica'),
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
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text('XXXXX SAR',
                                  style: TextStyle(
                                      fontSize: 20.0, fontFamily: 'SFProText')),
                            ),
                          ],
                        )
                      ],
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,
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
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
                  child: Container(
                    width: MediaQuery.of(context).size.width -
                        40, // Set width to match screen width
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
                    child: DataTable(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(216, 216, 216, 1),
                            offset: Offset(0, 1),
                            blurRadius: 2, // changes position of shadow
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
                              fontFamily: 'SFProText'),
                          textAlign: TextAlign.center,
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'Booking Id',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'SFProText'),
                          textAlign: TextAlign.center,
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'Date',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'SFProText'),
                          textAlign: TextAlign.center,
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'Unit Type',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'SFProText'),
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
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'Payment Status',
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
                              'Xxx SAR',
                              'Completed'
                            ])
                              DataCell(
                                Container(
                                  height: 65, // Adjust height as needed
                                  alignment: Alignment.center,
                                  child: Text(item,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'SFproText')),
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
                              'Xxx SAR',
                              'Completed'
                            ])
                              DataCell(
                                Container(
                                  height: 65, // Adjust height as needed
                                  alignment: Alignment.center,
                                  child: Text(item,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'SFproText')),
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
                              'Xxx SAR',
                              'Completed'
                            ])
                              DataCell(
                                Container(
                                  height: 65, // Adjust height as needed
                                  alignment: Alignment.center,
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                        fontSize: 20, fontFamily: 'SFproText'),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color.fromRGBO(255, 255, 255, 0.925),
            ),
            padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
                  child: Scrollbar(
                    controller: _scrollController,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      child: Container(
                        width: 1400,
                        height: 100, // Increased height to accommodate button
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  color: Color.fromRGBO(149, 143, 143, 1)),
                            ),
                            Text(
                              'Paid : SAR xxxxx',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'SFProText',
                                  color: Color.fromRGBO(149, 143, 143, 1)),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Balance',
                                  style: TextStyle(
                                      fontSize: 16.0, fontFamily: 'Helvetica'),
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
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text('XXXXX SAR',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: 'SFProText')),
                                ),
                              ],
                            )
                          ],
                        ),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(199, 199, 199, 1)
                                  .withOpacity(0.5),
                              blurRadius: 1,
                              spreadRadius: 2,
                              offset: Offset(0, 0.5), // Bottom side shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
                  child: Container(
                    width: MediaQuery.of(context).size.width -
                        40, // Set width to match screen width
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
                            DataColumn(
                                label: Expanded(
                                    child: Text(
                              'Payment Status',
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
                                  'Xxx SAR',
                                  'Completed'
                                ])
                                  DataCell(
                                    Container(
                                      height: 65, // Adjust height as needed
                                      alignment: Alignment.center,
                                      child: Text(item,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'SFproText')),
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
                                  'Xxx SAR',
                                  'Completed'
                                ])
                                  DataCell(
                                    Container(
                                      height: 65, // Adjust height as needed
                                      alignment: Alignment.center,
                                      child: Text(item,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'SFproText')),
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
                                  'Xxx SAR',
                                  'Completed'
                                ])
                                  DataCell(
                                    Container(
                                      height: 65, // Adjust height as needed
                                      alignment: Alignment.center,
                                      child: Text(
                                        item,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'SFproText'),
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
