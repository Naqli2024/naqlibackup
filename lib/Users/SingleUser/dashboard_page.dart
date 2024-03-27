import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/DialogBox/bookingdialog.dart';

import 'package:sizer/sizer.dart';
import '../../Widgets/customButton.dart';
import '../../Widgets/formText.dart';
import '../../classes/language.dart';
import '../../classes/language_constants.dart';
import '../../main.dart';
import 'bookings.dart';
import 'dashboard.dart';
import 'payments.dart';
import 'bookingHistory.dart';

class SingleUserDashboardPage extends StatefulWidget {
  final User user;
  const SingleUserDashboardPage({required this.user});

  @override
  State<SingleUserDashboardPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SingleUserDashboardPage> {
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
  Widget _currentContent = Bookings(); // Initial content

  void _handleItem1Tap() {
    setState(() {
      _currentContent = Bookings();
    });
    Navigator.pop(context);
  }

  void _handleItem2Tap() {
    setState(() {
      _currentContent = BookingHistroy();
    });
    Navigator.pop(context);
  }

  void _handleItem3Tap() {
    setState(() {
      _currentContent = SingleUserPayment();
    });
    Navigator.pop(context);
  }

  void _handleItem4Tap() {
    setState(() {
      _currentContent = SingleUserPayment();
    });
    Navigator.pop(context);
  }

  void _handleItem5Tap() {
    setState(() {
      _currentContent = BookingHistroy();
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
                        'naqlilogo.png',
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
                                fontFamily: "HelveticaNeueRegular",
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
                                fontFamily: "HelveticaNeueRegular",
                                color: Color.fromRGBO(206, 203, 203, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          DropdownButtonHideUnderline(
                            child: DropdownButton2<Language>(
                              isExpanded: true,
                              hint: Row(
                                children: [
                                  Text(
                                    translation(context).english,
                                    style: TabelText.helvetica11,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Expanded(child: SizedBox()),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                    size: 25,
                                  )
                                ],
                              ),
                              onChanged: (Language? language) async {
                                if (language != null) {
                                  Locale _locale =
                                      await setLocale(language.languageCode);
                                  MyApp.setLocale(context, _locale);
                                } else {
                                  language;
                                }
                              },
                              items: Language.languageList()
                                  .map<DropdownMenuItem<Language>>(
                                    (e) => DropdownMenuItem<Language>(
                                      value: e,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Text(
                                            e.flag,
                                            style: TabelText.helvetica11,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            e.langname,
                                            style: TabelText.helvetica11,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                              buttonStyleData: ButtonStyleData(
                                height: 30,
                                width: 130,
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.black26,
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.arrow_drop_down_sharp,
                                ),
                                iconSize: 25,
                                iconEnabledColor: Colors.white,
                                iconDisabledColor: null,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: 210,
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 5, bottom: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.black26),
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
                              menuItemStyleData: const MenuItemStyleData(
                                height: 25,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            height: 40,
                            child: VerticalDivider(
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 5,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Hello Faizal!",
                                    style: TabelText.helvetica11),
                                Text("Admin", style: TabelText.usertext),
                                Text("Faizal industries",
                                    style: TabelText.usertext),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.notifications,
                            color: Color.fromRGBO(106, 102, 209, 1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(6.w, 6.h, 6.w, 6.h),
                child: Container(
                  color: Color.fromRGBO(245, 243, 255, 1).withOpacity(0.5),
                  child: Row(
                    children: [
                      Container(
                        height: 850,
                        width: 360,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 216, 214, 214)
                                .withOpacity(0.5),
                          ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Color.fromARGB(255, 199, 198, 198)
                                  .withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 4,
                              offset: Offset(0, 0.5), // Bottom side shadow
                            ),
                            BoxShadow(
                              color: Color.fromARGB(255, 255, 255, 255)
                                  .withOpacity(0.1),
                              blurRadius: 1,
                              spreadRadius: 0, // Bottom side shadow
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(13),
                            bottomLeft: Radius.circular(13),
                            topRight: Radius.circular(0),
                            bottomRight: Radius.circular(13),
                          ),
                          color: Color.fromRGBO(236, 233, 250, 1),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 370,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(7),
                                  bottomLeft: Radius.circular(7),
                                  topRight: Radius.circular(0),
                                  bottomRight: Radius.circular(7),
                                ),
                              ),
                              child: Image.asset(
                                'Circleavatar.png',
                                width: 550, // Adjust the height as needed
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              height: 35.h,
                              padding: EdgeInsets.only(left: 1.5.w, top: 50),
                              child: SideMenu(
                                controller: sideMenu,
                                style: SideMenuStyle(
                                  // displayMode: SideMenuDisplayMode.auto,
                                  selectedColor:
                                      Color.fromRGBO(98, 105, 254, 1),
                                  unselectedTitleTextStyle: const TextStyle(
                                    fontFamily: 'SFProText',
                                    fontSize: 18,
                                    color: Color.fromRGBO(128, 118, 118, 1),
                                  ),
                                  selectedTitleTextStyle: const TextStyle(
                                    fontFamily: 'SFProText',
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                  unselectedIconColor:
                                      Color.fromRGBO(128, 118, 118, 1),
                                  selectedIconColor: Colors.white,
                                ),
                                items: [
                                  SideMenuItem(
                                    title: 'Booking',
                                    onTap: (page, _) {
                                      setState(() {
                                        _currentContent = Bookings();
                                      });
                                      sideMenu.changePage(page);
                                    },
                                    icon: Icon(Icons.login_outlined),
                                  ),
                                  SideMenuItem(
                                    title: 'Booking History',
                                    onTap: (page, _) {
                                      setState(() {
                                        _currentContent = BookingHistroy();
                                      });
                                      sideMenu.changePage(page);
                                    },
                                    icon: Icon(Icons.person_2_outlined),
                                  ),
                                  SideMenuItem(
                                    title: 'Payments',
                                    onTap: (page, _) {
                                      setState(() {
                                        _currentContent = SingleUserPayment();
                                      });
                                      sideMenu.changePage(page);
                                    },
                                    icon: Icon(Icons.person_2_outlined),
                                    // Set the style property to change the text size
                                  ),
                                  SideMenuItem(
                                    title: 'Report',
                                    onTap: (page, _) {
                                      setState(() {
                                        _currentContent = SingleUserPayment();
                                      });
                                      sideMenu.changePage(page);
                                    },
                                    icon:
                                        const Icon(Icons.mode_comment_outlined),
                                  ),
                                  SideMenuItem(
                                    title: 'Help',
                                    onTap: (page, _) {
                                      setState(() {
                                        _currentContent = Dashboard();
                                      });
                                      sideMenu.changePage(page);
                                    },
                                    icon: Icon(Icons.inbox_outlined),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(4.w, 4.5.h, 3.w, 2.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 630,
                                  decoration: BoxDecoration(
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Color.fromRGBO(199, 199, 199, 1)
                                            .withOpacity(0.5),
                                        blurRadius: 15,
                                        spreadRadius: 3,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Color.fromRGBO(255, 255, 255, 0.00),
                                  ),
                                  child: PageView(
                                      controller: page,
                                      children: [_currentContent]),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                CustomButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return BookingDialog();
                                      },
                                    );
                                  },
                                  text: 'Confirm Booking',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
                          'Booking',
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {
                          setState(() {
                            _currentContent = Bookings();
                          });
                          Navigator.pop(context);
                        }),
                    SizedBox(
                      height: 2.h,
                    ),
                    ListTile(
                        hoverColor: Colors.indigo.shade100,
                        title: Text(
                          'Booking History',
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {
                          setState(() {
                            _currentContent = BookingHistroy();
                          });
                          Navigator.pop(context);
                        }),
                    SizedBox(
                      height: 2.h,
                    ),
                    ListTile(
                        hoverColor: Colors.indigo.shade100,
                        title: Text(
                          'Payments',
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {
                          setState(() {
                            _currentContent = SingleUserPayment();
                          });
                          Navigator.pop(context);
                        }),
                    SizedBox(
                      height: 2.h,
                    ),
                    ListTile(
                        hoverColor: Colors.indigo.shade100,
                        title: Text(
                          'Report',
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {
                          setState(() {
                            _currentContent = SingleUserPayment();
                          });
                          Navigator.pop(context);
                        }),
                    SizedBox(
                      height: 2.h,
                    ),
                    ListTile(
                        hoverColor: Colors.indigo.shade100,
                        title: Text(
                          'Help',
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {
                          setState(() {
                            _currentContent = Dashboard();
                          });
                          Navigator.pop(context);
                        }),
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
                              fontFamily: "HelveticaNeueRegular",
                              color: Color.fromRGBO(206, 203, 203, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: Expanded(
                child: Padding(
              padding: EdgeInsets.fromLTRB(6.w, 6.h, 6.w, 6.h),
              child: Container(
                  color: Color.fromRGBO(245, 243, 255, 1).withOpacity(0.5),
                  child: Expanded(child: _currentContent)),
            )),
          );
        }
      });
    });
  }
}
