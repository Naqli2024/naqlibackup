import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Widgets/customButton.dart';
import 'package:flutter_application_1/Widgets/customRadio.dart';
import 'package:flutter_application_1/Widgets/formText.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

class Bookings extends StatefulWidget {
  Bookings();
  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  GoogleMapController? mapController;
  List<Marker> _markers = [];
  bool isButtonEnabled = false;
  bool isButtonEnabled1 = false;
  bool isButtonEnabled2 = false;
  bool showmaps = true;
  int? selectedRadioValue;
  int? selectedRadioValue1;
  int? selectedRadioValue2;

  final LatLng _center = const LatLng(45.521563, -122.677433);
  final ScrollController _book1Scroll = ScrollController();
  final ScrollController _book2Scroll = ScrollController();
  final ScrollController _book3Scroll = ScrollController();
  final ScrollController _scrollController = ScrollController();
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

  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 950) {
          return SingleChildScrollView(
            child: Container(
              height: 630,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color.fromRGBO(255, 255, 255, 0.925),
              ),
              padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
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
                                style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontSize: 21,
                                    color: Color.fromRGBO(16, 3, 3, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Container(
                                height: 404,
                                width: 456,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12)),
                                child: GoogleMap(
                                    onMapCreated: (controller) {
                                      setState(() {
                                        mapController = controller;
                                      });
                                    },
                                    markers: Set<Marker>.of(_markers),
                                    mapType: MapType.normal,
                                    initialCameraPosition: CameraPosition(
                                        target: LatLng(24.755562, 46.589584),
                                        zoom: 13)),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Pick up truck",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: "Helvetica",
                                        color: Color.fromRGBO(16, 3, 3, 1)),
                                  ),
                                  Text("Toyota Hilux")
                                ],
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 63,
                                    child: VerticalDivider(
                                      color: Color.fromRGBO(112, 112, 112, 1),
                                      thickness: 2,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Load",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Helvetica",
                                        color: Color.fromRGBO(16, 3, 3, 1)),
                                  ),
                                  Text(
                                    "Woods",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Helvetica",
                                        color: Color.fromRGBO(16, 3, 3, 1)),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Size",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: "Helvetica",
                                        color: Color.fromRGBO(16, 3, 3, 1)),
                                  ),
                                  Text(
                                    " 1 to 1.5",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Helvetica",
                                        color: Color.fromRGBO(16, 3, 3, 1)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 556,
                        child: VerticalDivider(
                          color: Color.fromRGBO(204, 195, 195, 1),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5.w, 8.h, 5.w, 8.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                "Cancel Request",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Helvetica",
                                    color: Color.fromRGBO(158, 101, 169, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 110,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(
                                onPressed: () {},
                                text: 'Pay Advance: XXXX',
                              ),
                              CustomButton(
                                onPressed: () {},
                                text: 'Pay: XXXX',
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Expanded(
            child: Container(
              color: Color.fromRGBO(255, 255, 255, 200),
              padding: EdgeInsets.fromLTRB(3.w, 1.5.h, 3.w, 1.5.h),
            ),
          );
        }
      });
    });
  }
}
