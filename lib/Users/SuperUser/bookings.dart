import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Widgets/customButton.dart';
import 'package:flutter_application_1/Widgets/formText.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:sizer/sizer.dart';

class Bookings extends StatefulWidget {
  Bookings();
  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  final ScrollController _book1Scroll = ScrollController();
  final ScrollController _book2Scroll = ScrollController();
  final ScrollController _book3Scroll = ScrollController();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 950) {
          return SingleChildScrollView(
            child: Container(
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color.fromRGBO(255, 255, 255, 0.925),
              ),
              padding: EdgeInsets.fromLTRB(3.w, 5.h, 3.w, 3.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(240, 240, 240, 1)
                                    .withOpacity(0.1),
                                offset: Offset(0, 0),
                                spreadRadius: 2.0,
                                blurRadius: 0.01, // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                          ),
                          child: Expanded(
                            child: Column(
                              children: [
                                Container(
                                  height: 55,
                                  color: Color.fromRGBO(
                                      75, 61, 82, 1), // Brown color
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        1.5.w, 1.5.h, 1.5.w, 1.5.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Booking 1',
                                            style: TabelText.headerText),
                                        Text("Booking iD XXXXXX",
                                            style: TabelText.text3),
                                      ],
                                    ),
                                  ),
                                ),
                                // Add spacing between the brown container and the white container

                                SizedBox(
                                  height: 200,
                                  child: ListView(
                                    children: [_booking1Table()],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4.5.w,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(240, 240, 240, 1)
                                    .withOpacity(0.1),
                                offset: Offset(0, 0),
                                spreadRadius: 2.0,
                                blurRadius: 0.01, // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                          ),
                          child: Expanded(
                            child: Column(
                              children: [
                                Container(
                                  height: 55,
                                  color: Color.fromRGBO(
                                      75, 61, 82, 1), // Brown color
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        1.5.w, 1.5.h, 1.5.w, 1.5.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Booking 2',
                                            style: TabelText.headerText),
                                        Text("Booking iD XXXXXX",
                                            style: TabelText.text3),
                                      ],
                                    ),
                                  ),
                                ),
                                // Add spacing between the brown container and the white container

                                SizedBox(
                                  height: 200,
                                  child: ListView(
                                    children: [_booking1Table()],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4.5.w,
                      ),
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(240, 240, 240, 1)
                                  .withOpacity(0.1),
                              offset: Offset(0, 0),
                              spreadRadius: 2.0,
                              blurRadius: 0.01, // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 55,

                              color:
                                  Color.fromRGBO(75, 61, 82, 1), // Brown color
                              child: Center(
                                child: Text('New Booking',
                                    style: TabelText.headerText),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHomePage(),
                                  ),
                                );
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 195,
                                  child: Image.asset(
                                    color: Color.fromRGBO(225, 225, 225, 1),
                                    'add.png',
                                    width: 60,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Scrollbar(
                    controller: _book3Scroll,
                    thumbVisibility:
                        true, // Set to true to always show the scrollbar
                    child: SingleChildScrollView(
                      controller: _book3Scroll,
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        width: 1150,
                        height: 210,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(240, 240, 240, 1)
                                  .withOpacity(0.1),
                              offset: Offset(0, 0),
                              spreadRadius: 2.0,
                              blurRadius: 0.01, // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListView(
                          children: [_createDataTable()],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container(
            height: 100.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color.fromRGBO(255, 255, 255, 0.925),
            ),
            child: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5.w, 1.5.h, 5.w, 1.5.h),
                      color: Color.fromRGBO(255, 255, 255, 157),
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Scrollbar(
                              controller: _book1Scroll,
                              thumbVisibility:
                                  true, // Set to true to always show the scrollbar
                              child: SingleChildScrollView(
                                controller: _book1Scroll,
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(0),
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12)),
                                  ),
                                  width: 800,
                                  child: Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 55,
                                          color: Color.fromRGBO(
                                              75, 61, 82, 1), // Brown color
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                1.5.w, 1.5.h, 1.5.w, 1.5.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Booking 1',
                                                    style:
                                                        TabelText.headerText),
                                                Text("Booking iD XXXXXX",
                                                    style: TabelText.text3),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Add spacing between the brown container and the white container

                                        SizedBox(
                                          height: 220,
                                          child: ListView(
                                            children: [_booking1Table()],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Scrollbar(
                              controller: _book2Scroll,
                              thumbVisibility:
                                  true, // Set to true to always show the scrollbar
                              child: SingleChildScrollView(
                                controller: _book2Scroll,
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(0),
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12)),
                                  ),
                                  width: 800,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 55,
                                        color: Color.fromRGBO(
                                            75, 61, 82, 1), // Brown color
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              1.5.w, 1.5.h, 1.5.w, 1.5.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Booking 2',
                                                  style: TabelText.headerText),
                                              Text("Booking iD XXXXXX",
                                                  style: TabelText.text3),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Add spacing between the brown container and the white container
                                      SizedBox(
                                        height: 220,
                                        child: ListView(
                                          children: [_booking1Table()],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0),
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12)),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 55,

                                    color: Color.fromRGBO(
                                        75, 61, 82, 1), // Brown color
                                    child: Center(
                                      child: Text('New Booking',
                                          style: TabelText.headerText),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyHomePage(),
                                        ),
                                      );
                                    },
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 195,
                                        child: Image.asset(
                                          color:
                                              Color.fromRGBO(225, 225, 225, 1),
                                          'add.png',
                                          width: 60,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Scrollbar(
                              controller: _book3Scroll,
                              thumbVisibility:
                                  true, // Set to true to always show the scrollbar
                              child: SingleChildScrollView(
                                controller: _book3Scroll,
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  width: 950,
                                  height: 230,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: ListView(
                                    children: [_createDataTable()],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))),
          );
        }
      });
    });
  }

  DataTable _createDataTable() {
    return DataTable(
        headingRowHeight: 55,
        headingRowColor: MaterialStateColor.resolveWith(
          (states) => Color.fromRGBO(75, 61, 82, 1),
        ),
        columns: _createColumns(),
        rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('Booking ID', style: TabelText.headerText)),
      DataColumn(label: Text('Mode', style: TabelText.headerText)),
      DataColumn(label: Text('Booking Type', style: TabelText.headerText)),
      DataColumn(label: Text('Vendor', style: TabelText.headerText)),
      DataColumn(label: Text('Payment Status', style: TabelText.headerText)),
      DataColumn(label: Text('Status', style: TabelText.headerText)),
      DataColumn(label: Text('Actions', style: TabelText.headerText)),
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
  List<DataRow> _createRows() {
    return [
      DataRow(cells: [
        DataCell(Text('NAQBOOK***', style: TabelText.tableText)),
        DataCell(Text('Truck', style: TabelText.tableText)),
        DataCell(Text('Single', style: TabelText.tableText)),
        DataCell(Text('Vendor', style: TabelText.tableText)),
        DataCell(Text('Bal XXXX', style: TabelText.tableText)),
        DataCell(
          Center(
            child: Image.asset(
              'Group268.png',
              width: 50,
              height: 30,
            ),
          ),
        ),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () {},
                  icon: Image.asset('editicon.png')),
              SizedBox(
                width: 1.w,
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () {},
                  icon: Image.asset('deleteicon.png')),
            ],
          ),
        ),
      ]),
      DataRow(cells: [
        DataCell(Text('NAQBOOK***', style: TabelText.tableText)),
        DataCell(Text('Truck', style: TabelText.tableText)),
        DataCell(Text('Single', style: TabelText.tableText)),
        DataCell(Text('Vendor', style: TabelText.tableText)),
        DataCell(Text('Bal XXXX', style: TabelText.tableText)),
        DataCell(
          Center(
            child: Image.asset(
              'Group268.png',
              width: 50,
              height: 30,
            ),
          ),
        ),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () {},
                  icon: Image.asset('editicon.png')),
              SizedBox(
                width: 1.w,
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () {},
                  icon: Image.asset('deleteicon.png')),
            ],
          ),
        ),
      ]),
      DataRow(cells: [
        DataCell(Text('NAQBOOK***', style: TabelText.tableText)),
        DataCell(Text('Truck', style: TabelText.tableText)),
        DataCell(Text('Single', style: TabelText.tableText)),
        DataCell(Text('Vendor', style: TabelText.tableText)),
        DataCell(Text('Bal XXXX', style: TabelText.tableText)),
        DataCell(
          Center(
            child: Image.asset(
              'Group268.png',
              width: 50,
              height: 30,
            ),
          ),
        ),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () {},
                  icon: Image.asset('editicon.png')),
              SizedBox(
                width: 1.w,
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () {},
                  icon: Image.asset('deleteicon.png')),
            ],
          ),
        ),
      ]),
    ];
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
      DataColumn(
        label: SizedBox(),
        numeric: true,
      ),
      DataColumn(label: SizedBox(), numeric: false),
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
            child: SizedBox(
              width: 35,
              height: 35,
              child: SizedBox(
                width: 35,
                height: 35,
                child: CircleAvatar(),
              ),
            ),
          ),
        ),
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Truck', style: TabelText.text1),
                SizedBox(height: 3),
                Text("Truck no ******", style: TabelText.text2),
              ],
            ),
          ),
        ),
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: EditButton(
              text: 'View',
              onPressed: () {},
              colors: Color.fromRGBO(98, 106, 254, 1),
            ),
          ),
        ),
      ]),
      DataRow(cells: [
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: SizedBox(
              width: 35,
              height: 35,
              child: SizedBox(
                width: 35,
                height: 35,
                child: CircleAvatar(),
              ),
            ),
          ),
        ),
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pick Up Location', style: TabelText.text1),
                SizedBox(height: 3),
                Text("Destination Location", style: TabelText.text2),
              ],
            ),
          ),
        ),
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: EditButton(
              text: 'Edit',
              onPressed: () {},
              colors: Color.fromRGBO(98, 106, 254, 1),
            ),
          ),
        ),
      ]),
      DataRow(cells: [
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: SizedBox(
              width: 35,
              height: 35,
              child: SizedBox(
                width: 35,
                height: 35,
                child: CircleAvatar(),
              ),
            ),
          ),
        ),
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Balance Amount', style: TabelText.text1),
                SizedBox(height: 3),
                Text("07.02.2022", style: TabelText.text2),
              ],
            ),
          ),
        ),
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: EditButton(
              text: 'Pay',
              onPressed: () {},
              colors: Color.fromRGBO(98, 106, 254, 1),
            ),
          ),
        ),
      ]),
    ];
  }
}
