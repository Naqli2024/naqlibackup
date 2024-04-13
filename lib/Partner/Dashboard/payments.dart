import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/allUsersFormController.dart';
import 'package:flutter_application_1/Widgets/colorContainer.dart';
import 'package:flutter_application_1/Widgets/formText.dart';
import 'package:sizer/sizer.dart';

class Payments extends StatefulWidget {
  Payments();
  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  final ScrollController _paymentScroll = ScrollController();
  final ScrollController _scrollController1 = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  AllUsersFormController controller = AllUsersFormController();
  final fromDate = TextEditingController();
  final toDate = TextEditingController();
  DataTable _createDataTable() {
    return DataTable(
        headingRowHeight: 65,
        dataRowHeight: 80,
        headingRowColor: MaterialStateColor.resolveWith(
          (states) => Color.fromRGBO(75, 61, 82, 1),
        ),
        columns: _createColumns(),
        rows: _payments());
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text('Booking ID', style: TabelText.headerText),
          ),
        ),
      ),
      DataColumn(
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Center(child: Text('Booking Type', style: TabelText.headerText)),
        ),
      ),
      DataColumn(
        label: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text('Contract', style: TabelText.headerText),
          ),
        ),
      ),
      DataColumn(
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text('Status', style: TabelText.headerText),
          ),
        ),
      ),
      DataColumn(
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text('Payment Made', style: TabelText.headerText),
          ),
        ),
      ),
      DataColumn(
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text('Pending Payment', style: TabelText.headerText),
          ),
        ),
      ),
    ];
  }

  List<DataRow> _payments() {
    return [
      DataRow(cells: [
        DataCell(
          Text(
            'NAQBOOK***',
            style: TabelText.tableText1,
          ),
        ),
        DataCell(
          Center(child: Text('Single', style: TabelText.tableText1)),
        ),
        DataCell(Center(child: Text('_', style: TabelText.tableText1))),
        DataCell(
          Center(
            child: Image.asset(
              'Group353.png',
              width: 50,
              height: 30,
            ),
          ),
        ),
        DataCell(Center(child: Text('SAR XXXX', style: TabelText.headerText1))),
        DataCell(
            Center(child: Text('Completed', style: TabelText.headerText2))),
      ]),
      DataRow(cells: [
        DataCell(Text(
          'NAQBOOK***',
          style: TabelText.tableText1,
        )),
        DataCell(Center(child: Text('Contract', style: TabelText.tableText1))),
        DataCell(Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('SAR 3000', style: TabelText.tableText1),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text('Per Month-August 2024', style: TabelText.text4),
              ),
            ],
          ),
        )),
        DataCell(
          Center(
            child: Image.asset(
              'Group268.png',
              width: 50,
              height: 30,
            ),
          ),
        ),
        DataCell(Center(child: Text('SAR XXXX', style: TabelText.headerText1))),
        DataCell(
          Center(
            child: SizedBox(
              width: 95,
              height: 30,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(
                    color: Color.fromRGBO(92, 85, 67, 1),
                  ),
                ),
                child: Text(
                  'Running',
                  style: TextStyle(
                    color: Color.fromRGBO(92, 85, 67, 1),
                    fontSize: 12,
                    fontFamily: "Helvetica",
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
      DataRow(cells: [
        DataCell(Text(
          'NAQBOOK***',
          style: TabelText.tableText1,
        )),
        DataCell(Center(child: Text('Single', style: TabelText.tableText1))),
        DataCell(Center(child: Text('_', style: TabelText.tableText1))),
        DataCell(
          Center(
            child: Image.asset(
              'Group353.png',
              width: 50,
              height: 30,
            ),
          ),
        ),
        DataCell(Center(child: Text('SAR XXXX', style: TabelText.headerText1))),
        DataCell(
          Center(
            child: SizedBox(
              width: 95,
              height: 30,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(110, 90, 234, 1),
                  side: BorderSide(
                    color: Color.fromRGBO(110, 90, 234, 1),
                  ),
                ),
                child: Text(
                  'Pay Pal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: "Helvetica",
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    ];
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
                                    style: PaymentText.SFproText,
                                  ),
                                  Text('Booking Value : SAR xxxxxx',
                                      style: PaymentText.SFproText),
                                  Text('Payment made: SAR xxxxx',
                                      style: PaymentText.SFproText),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text('Pending Payment',
                                          style: PaymentText.SFproText18),
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
                                            side: BorderSide(
                                                color: Color.fromRGBO(
                                                    112, 112, 112, 1)),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              1.w, 5, 1.w, 5),
                                          child: Text('XXXXX SAR',
                                              style:
                                                  PaymentText.SFproTextwhite),
                                        ),
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
                                    'Booked by',
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
                                    'Mode',
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
                                    'Payment made',
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
                                        'Users',
                                        '3459678234',
                                        'Tow truck',
                                        '14/11/2023',
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
                                        'Users',
                                        '3459678234',
                                        'Mini van',
                                        '21/6/2023',
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
                                        'Users',
                                        '3459678234',
                                        'Bus',
                                        '13/9/2023',
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
