import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Partner/Dashboard/dashboard.dart';

import 'package:flutter_application_1/Partner/operator.dart';

import 'package:sizer/sizer.dart';

class HomePagePartner extends StatefulWidget {
  const HomePagePartner({Key? key}) : super(key: key);

  @override
  State<HomePagePartner> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePagePartner> {
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
                                  fontSize: 24,
                                  fontFamily: "HelveticaNeue",
                                  color: Color.fromRGBO(206, 203, 203, 1),
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
                                    fontSize: 24,
                                    fontFamily: "HelveticaNeue",
                                    color: Color.fromRGBO(100, 76, 76, 1),
                                    fontWeight: FontWeight.bold),
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
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Column(
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
                                  image: AssetImage('Group716.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: AssetImage('Group716.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 100),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sign Up Now",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(20, 3, 3, 1),
                                              fontSize: 55,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(width: 300),
                                        IconButton(
                                          icon: Icon(
                                            Icons.arrow_forward,
                                            color: Color.fromRGBO(20, 3, 3, 1),
                                            size: 71,
                                          ),
                                          onPressed: () {
                                            showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (context) {
                                                return (Operator());
                                              },
                                            ); // Add your onPressed functionality here
                                          },
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Adjust the height between "Sign Up Now" and its divider
                                  Padding(
                                    padding: const EdgeInsets.only(right: 130),
                                    child: SizedBox(
                                      width: 690,
                                      child: Divider(
                                        color: Color.fromRGBO(20, 3, 3,
                                            1), // Set the color of the divider
                                        thickness:
                                            2, // Set the thickness of the divider
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                  width:
                                      100), // Adjust the height between the divider and "Log in"
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Log in",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(20, 3, 3, 1),
                                              fontSize: 55,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(width: 350),
                                        IconButton(
                                          icon: Icon(
                                            Icons.arrow_forward,
                                            color: Color.fromRGBO(20, 3, 3, 1),
                                            size: 71,
                                          ),
                                          onPressed: () {
                                            // Add your onPressed functionality here
                                            print(
                                                'Log in Arrow button pressed');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Adjust the height between "Log in" and its divider
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: SizedBox(
                                      width: 590,
                                      child: Divider(
                                        color: Color.fromRGBO(20, 3, 3,
                                            1), // Set the color of the divider
                                        thickness:
                                            2, // Set the thickness of the divider
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 300,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Text(
                            "Naqli Advantage",
                            style: TextStyle(
                                fontSize: 34,
                                fontFamily: "HelveticaNeue",
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(20, 3, 3, 1)),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .center, // Adjust this line for proper alignment
                              children: [
                                Image.asset(
                                  'delivery.png',
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Regular trips",
                                  style: TextStyle(
                                      fontFamily: "HelveticaNeue",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "With our growing presence\n"
                                  "across multiple cities we\n"
                                  "always have our hands full\n"
                                  "This means you will never\n"
                                  "run out of trips.\n",
                                  style: TextStyle(
                                    fontFamily: "HelveticaNeue",
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .center, // Adjust this line for proper alignment
                              children: [
                                Image.asset(
                                  'stock.png',
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Better Earning",
                                  style: TextStyle(
                                      fontFamily: "HelveticaNeue",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Earn more by partnering\n"
                                    "with the best! Regular trips\n"
                                    "and efficient service can\n"
                                    "This means you will never\n"
                                    "grow your earnings!\n",
                                    style: TextStyle(
                                      fontFamily: "HelveticaNeue",
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .center, // Adjust this line for proper alignment
                              children: [
                                Image.asset(
                                  'payment.png',
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "On_Time Payment",
                                  style: TextStyle(
                                      fontFamily: "HelveticaNeue",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Text(
                                    "Be assured to receive all\n"
                                    "payments on time & get the best\n"
                                    "in class support.\n",
                                    style: TextStyle(
                                      fontFamily: "HelveticaNeue",
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ));
        } else {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Container(
                height: 60,
                child: Material(
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(2.5.w, 0, 2.5.w, 0),
                    child: Row(
                      children: [
                        Image.asset(
                          'Naqli-final-logo.png',
                          width: 10.w,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(4.5.w, 0, 0, 0),
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
                          padding: EdgeInsets.only(left: 25.0, top: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.notifications,
                                color: Color.fromRGBO(106, 102, 209, 1),
                              ),
                              SizedBox(
                                height: 30,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, top: 5),
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
            body: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 300,
                  ),
                  items: [
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage('Group716.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage('Group716.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    children: [
                      Text(
                        "Sign Up Now",
                        style: TextStyle(
                            color: Color.fromRGBO(20, 3, 3, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 30),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Color.fromRGBO(20, 3, 3, 1),
                          size: 20,
                        ),
                        onPressed: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return (Operator());
                            },
                          ); // Add your onPressed functionality here
                        },
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      Text(
                        "Log in",
                        style: TextStyle(
                            color: Color.fromRGBO(20, 3, 3, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 30),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Color.fromRGBO(20, 3, 3, 1),
                          size: 20,
                        ),
                        onPressed: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return (Operator());
                            },
                          ); // Add your onPressed functionality here
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: SizedBox(
                          width: 140,
                          child: Divider(
                            color: Color.fromRGBO(
                                20, 3, 3, 1), // Set the color of the divider
                            thickness: 2, // Set the thickness of the divider
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 55),
                        child: SizedBox(
                          width: 100,
                          child: Divider(
                            color: Color.fromRGBO(
                                20, 3, 3, 1), // Set the color of the divider
                            thickness: 2, // Set the thickness of the divider
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Naqli Advantage",
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: "HelveticaNeue",
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(20, 3, 3, 1)),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // Adjust this line for proper alignment
                        children: [
                          Image.asset(
                            'delivery.png',
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Regular trips",
                            style: TextStyle(
                                fontFamily: "HelveticaNeue",
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "With our growing presence\n"
                            "across multiple cities we\n"
                            "always have our hands full\n"
                            "This means you will never\n"
                            "run out of trips.\n",
                            style: TextStyle(
                              fontFamily: "HelveticaNeue",
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .center, // Adjust this line for proper alignment
                          children: [
                            Image.asset(
                              'stock.png',
                              width: 50,
                              height: 50,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Better Earning",
                              style: TextStyle(
                                  fontFamily: "HelveticaNeue",
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Earn more by partnering\n"
                                "with the best! Regular trips\n"
                                "and efficient service can\n"
                                "This means you will never\n"
                                "grow your earnings!\n",
                                style: TextStyle(
                                  fontFamily: "HelveticaNeue",
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // Adjust this line for proper alignment
                        children: [
                          Image.asset(
                            'payment.png',
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "On_Time Payment",
                            style: TextStyle(
                                fontFamily: "HelveticaNeue",
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              "Be assured to receive all\n"
                              "payments on time & get the best\n"
                              "in class support.\n",
                              style: TextStyle(
                                fontFamily: "HelveticaNeue",
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      });
    });
  }
}
