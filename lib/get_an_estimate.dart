import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/colorContainer.dart';
import 'package:sizer/sizer.dart';

class GetanEstimate extends StatefulWidget {
  @override
  _GetanEstimateState createState() => _GetanEstimateState();
}

class _GetanEstimateState extends State<GetanEstimate> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 1180) {
          return Padding(
            padding: EdgeInsets.only(
              left: 18.w,
              right: 18.w,
              top: 8.h,
              bottom: 8.h,
            ),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(31))),
              child: Container(
                height: 770,
                child: Row(
                  children: [
                    Container(
                      width: 23.w,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(13, 13, 255, 1).withOpacity(0.3),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(31),
                          bottomLeft: Radius.circular(31),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 60, top: 90),
                            child: Row(
                              children: [
                                Text(
                                  'Get an\n'
                                  'Estimate',
                                  style: TextStyle(
                                    fontSize: 48,
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(height:3.0),

                          SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Row(
                              children: [
                                Text(
                                  'To ensure we give you the best\n'
                                  'Possible service ,kindly fill out the\n'
                                  'Information',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Helvetica",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 775,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(31),
                            bottomRight: Radius.circular(31),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 30, top: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: ImageIcon(
                                        AssetImage('cancel.png'),
                                        color: Color.fromRGBO(112, 112, 112, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 2.h),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 40,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: ElevationUnitContainer(
                                        text1: 'Vehicle',
                                        imgpath: 'Group68.png',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ElevationUnitContainer(
                                      text1: 'Bus',
                                      imgpath: 'bus.png',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ElevationUnitContainer(
                                      text1: 'Equipment',
                                      imgpath: 'Group1496.png',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ElevationUnitContainer(
                                      text1: 'Special',
                                      imgpath: 'Group1660.png',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ElevationUnitContainer(
                                      text1: 'Others',
                                      imgpath: 'Group1716.png',
                                    ),
                                    SizedBox(height: 25),
                                  ],
                                ),
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
          );
        } else {
          return Container();
        }
      });
    });
  }
}
