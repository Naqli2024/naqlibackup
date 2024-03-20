import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/Partner/Dashboard/dashboard.dart';

import 'package:sizer/sizer.dart';
import 'bookings.dart';
import 'payments.dart';
import 'trigger_booking.dart';

class partnerDashboardPage extends StatefulWidget {
  const partnerDashboardPage({Key? key}) : super(key: key);

  @override
  State<partnerDashboardPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<partnerDashboardPage> {
  PageController page = PageController();
  SideMenuController sideMenu = SideMenuController();
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
  Widget _currentContent = Dashboard(); // Initial content

  void _handleItem1Tap() {
    setState(() {
      _currentContent = Dashboard();
    });
    Navigator.pop(context);
  }

  void _handleItem2Tap() {
    setState(() {
      _currentContent = TriggerBooking();
    });
    Navigator.pop(context);
  }

  void _handleItem3Tap() {
    setState(() {
      _currentContent = Bookings();
    });
    Navigator.pop(context);
  }

  void _handleItem4Tap() {
    setState(() {
      _currentContent = Payments();
    });
    Navigator.pop(context);
  }

  void _handleItem5Tap() {
    setState(() {
      _currentContent = TriggerBooking();
    });
    Navigator.pop(context);
  }

  void _handleItem6Tap() {
    setState(() {
      _currentContent = TriggerBooking();
    });
    Navigator.pop(context);
  }

  void handleRadioValueChanged(String? newValue) {
    setState(() {
      selectedValue = newValue;
    });
    print('Selected value: $selectedValue');
  }

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

  void tapOnPieChart(FlTouchEvent event, PieTouchResponse? response) {
    if (response != null) {
      final sectionIndex = response.touchedSection!.touchedSectionIndex;
      final value = response.touchedSection!.touchedSection!.value;
      if (sectionIndex == 0) {
        month = 'January - $value';
      } else if (sectionIndex == 1) {
        month = 'February - $value';
      } else if (sectionIndex == 2) {
        month = 'March - $value';
      } else if (sectionIndex == 3) {
        month = 'April - $value';
      } else if (sectionIndex == 4) {
        month = 'May - $value';
      }
      setState(() {});
      print('Tapped on section: $sectionIndex');
      // You can add your custom logic here to respond to the tap on the Pie Chart
    }
  }

  bool isAnyCheckboxSelected() {
    return checkbox1 || checkbox2 || checkbox3;
  }

  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 850) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(75),
              child: Material(
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 0, 2.5.w, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'Naqli-final-logo.png',
                        width: 10.w,
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
                                fontFamily: "HelveticaNeue",
                                color: Color.fromRGBO(112, 112, 112, 1),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
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
                                fontSize: 16,
                                fontFamily: "HelveticaNeue",
                                color: Color.fromRGBO(206, 203, 203, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20.0, top: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.notifications,
                              color: Color.fromRGBO(106, 102, 209, 1),
                            ),
                            SizedBox(
                              height: 30,
                              child: Padding(
                                padding: EdgeInsets.only(left: 15, top: 5),
                                child: Text(
                                  "Contact Us",
                                  style: TextStyle(
                                    fontFamily: 'Colfax',
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: 30,
                              child: VerticalDivider(
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 170,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 13, top: 5),
                                child: Text(
                                  "Hello Faizal!",
                                  style: TextStyle(
                                    fontFamily: 'Colfax',
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.fromLTRB(1.w, 2.h, 1.w, 2.h),
              child: Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(3.w, 6.h, 3.w, 6.h),
                  child: Container(
                    color: Color.fromRGBO(245, 243, 255, 1),
                    child: Row(
                      children: [
                        Container(
                          width: 330,
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Color.fromARGB(255, 216, 214, 214),
                                  blurRadius: 10,
                                  spreadRadius: 5,
                                  offset: Offset(1, 0.75))
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                            color: Color.fromRGBO(236, 233, 250, 1),
                          ),
                          child: Column(
                            children: [
                              Card(
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: Color.fromARGB(255, 240, 237, 250),
                                child: Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          30.0), // Adjust the radius as needed
                                      child: Image.asset(
                                        'Circleavatar.png',
                                        width:
                                            550, // Adjust the height as needed
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 1.5, top: 20),
                                child: SizedBox(
                                  height: 30.h,
                                  child: SideMenu(
                                    controller: sideMenu,
                                    style: SideMenuStyle(
                                      displayMode: SideMenuDisplayMode.auto,
                                      selectedColor:
                                          Color.fromRGBO(98, 105, 254, 1),
                                      unselectedTitleTextStyle: const TextStyle(
                                        fontFamily: 'SFProText',
                                        fontSize: 14,
                                        color: Color.fromRGBO(128, 118, 118, 1),
                                      ),
                                      selectedTitleTextStyle: const TextStyle(
                                          fontFamily: 'SFProText',
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                      unselectedIconColor:
                                          Color.fromRGBO(128, 118, 118, 1),
                                      selectedIconColor: Colors.white,
                                    ),
                                    items: [
                                      SideMenuItem(
                                        title: 'Dashboard',
                                        onTap: (page, _) {
                                          sideMenu.changePage(page);
                                        },
                                        icon: const Icon(Icons.login_outlined),
                                      ),
                                      SideMenuItem(
                                        title: 'Trigger Booking',
                                        onTap: (page, _) {
                                          sideMenu.changePage(page);
                                        },
                                        icon:
                                            const Icon(Icons.person_2_outlined),
                                      ),
                                      SideMenuItem(
                                        title: 'Bookings',
                                        onTap: (page, _) {
                                          sideMenu.changePage(page);
                                        },
                                        icon:
                                            const Icon(Icons.person_2_outlined),
                                        // Set the style property to change the text size
                                      ),
                                      SideMenuItem(
                                        title: 'Payments',
                                        onTap: (page, _) {
                                          sideMenu.changePage(page);
                                        },
                                        icon: const Icon(
                                            Icons.mode_comment_outlined),
                                      ),
                                      SideMenuItem(
                                        title: 'Help',
                                        onTap: (page, _) {
                                          sideMenu.changePage(page);
                                        },
                                        icon: const Icon(Icons.inbox_outlined),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Color.fromARGB(255, 202, 200, 200),
                                    blurRadius: 25,
                                    spreadRadius: 5,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(20.0),
                                color: Color.fromRGBO(255, 255, 255, 0.00),
                              ),
                              child: PageView(controller: page, children: [
                                Dashboard(),
                                TriggerBooking(),
                                Bookings(),
                                Payments(),
                                Container(
                                  color: Colors.pink,
                                ),
                                Container(
                                  color: Colors.deepOrangeAccent,
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            drawer: Drawer(
              child: ListView(
                  padding: EdgeInsets.only(
                    top: 3.h,
                  ),
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            30.0), // Adjust the radius as needed
                        child: Image.asset(
                          'Circleavatar.png',
                          width: 550, // Adjust the height as needed
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    ListTile(
                        hoverColor: Colors.indigo.shade100,
                        title: Text(
                          'Dashboard',
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: _handleItem1Tap),
                    SizedBox(
                      height: 2.h,
                    ),
                    ListTile(
                        hoverColor: Colors.indigo.shade100,
                        title: Text(
                          'Trigger Booking',
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: _handleItem2Tap),
                    SizedBox(
                      height: 2.h,
                    ),
                    ListTile(
                        hoverColor: Colors.indigo.shade100,
                        title: Text(
                          'Bookings',
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: _handleItem3Tap),
                    SizedBox(
                      height: 2.h,
                    ),
                    ListTile(
                        hoverColor: Colors.indigo.shade100,
                        title: Text(
                          'Payments',
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: _handleItem4Tap),
                    SizedBox(
                      height: 2.h,
                    ),
                    ListTile(
                        hoverColor: Colors.indigo.shade100,
                        title: Text(
                          'Help',
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: _handleItem6Tap),
                  ]),
            ),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Container(
                height: 60,
                child: Material(
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(2.5.w, 0, 2.5.w, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(
                            builder: (context) => IconButton(
                                  onPressed: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  icon: Icon(
                                    Icons.menu_rounded,
                                    color: Colors.indigo.shade900,
                                  ),
                                )),
                        Image.asset(
                          'Naqli-final-logo.png',
                          width: 10.w,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(2.0.w, 0, 0, 0),
                          child: TextButton(
                            onPressed: () {
                              // Handle the first button press
                            },
                            child: Text(
                              'User',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "HelveticaNeue",
                                color: Color.fromRGBO(206, 203, 203, 1),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                          height: 20, // Adjust this value to reduce space
                          child: VerticalDivider(
                            color: Color.fromRGBO(206, 203, 203, 1),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(1.0.w, 0, 0, 0),
                          child: TextButton(
                            onPressed: () {
                              // Handle the third button press
                            },
                            child: Text(
                              'Partner',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "HelveticaNeue",
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(112, 112, 112, 1),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5.0, top: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.notifications,
                                color: Color.fromRGBO(106, 102, 209, 1),
                              ),
                              SizedBox(
                                height: 30,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 3, top: 5),
                                  child: Text(
                                    "Contact Us",
                                    style: TextStyle(
                                      fontFamily: 'Colfax',
                                      fontSize: 12,
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
                              SizedBox(
                                height: 30,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                  ),
                                  child: Text(
                                    "Hello Faizal!",
                                    style: TextStyle(
                                      fontFamily: 'Colfax',
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.fromLTRB(6.w, 3.h, 6.w, 3.h),
              child: Container(
                  color: Color.fromRGBO(240, 237, 250, 1),
                  child: Expanded(child: _currentContent)),
            ),
          );
        }
      });
    });
  }
}
