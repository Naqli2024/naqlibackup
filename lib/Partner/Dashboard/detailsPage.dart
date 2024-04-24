import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Widgets/formText.dart';
import 'package:sizer/sizer.dart';

class Details extends StatefulWidget {
  String? partner;
  String? user;
  String? operName;
  String? pickup;
  String? dropoff;
  String? load;
  String? truck;
  String? labour;
  String? productValue;
  String? bookingid;
  String? date;
  String? time;

  Details(
      {this.partner,
      this.user,
      this.dropoff,
      this.labour,
      this.load,
      this.operName,
      this.pickup,
      this.productValue,
      this.truck,
      this.bookingid,
      this.date,
      this.time});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 1180) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: 15.3.h,
              bottom: 14.5.h,
            ),
            child: Card(
              elevation: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(31),
                ),
                height: 770,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, right: 20),
                            child: ImageIcon(
                              NetworkImage(
                                  'https://firebasestorage.googleapis.com/v0/b/naqli-5825c.appspot.com/o/cancel.png?alt=media&token=dd1ed39b-abda-4780-94dd-f5c15e7d12f5'),
                              color: Color.fromRGBO(112, 112, 112, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://firebasestorage.googleapis.com/v0/b/naqli-5825c.appspot.com/o/Group2251.png?alt=media&token=4e6f21cb-6a8b-4923-bbee-d04d096db282'),
                                    radius: 40,
                                  ),
                                  SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                            'Id  ${widget.user ?? '----'}',
                                            style:
                                                DetailsText.helvetica25black),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Container(
                                            width: 120,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors
                                                    .black, // Border color
                                                width: 0.5, // Border width
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      15.0), // Border radius
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                // Add your action here
                                              },
                                              child: Text(
                                                (widget.date != null &&
                                                        widget.time != null)
                                                    ? '${widget.date}, ${widget.time}'
                                                    : '---',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                    letterSpacing: 1,
                                                    fontFamily: 'Helvetica'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.only(left: 80),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.green,
                                        radius: 7,
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Pickup location',
                                              style:
                                                  BookingText.helvetica18bold),
                                          SizedBox(height: 3),
                                          Text('${widget.pickup ?? '----'}',
                                              style:
                                                  BookingText.helvetica16bold),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 90,
                                        child: VerticalDivider(
                                          color: Colors.black,
                                          thickness: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        'https://firebasestorage.googleapis.com/v0/b/naqli-5825c.appspot.com/o/Path1514.png?alt=media&token=cbfb499b-cc9b-4df6-bacd-35b1e4319f4c',
                                        width: 15,
                                        height: 15,
                                      ),
                                      SizedBox(width: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Dropoff location',
                                              style:
                                                  BookingText.helvetica18bold),
                                          SizedBox(height: 3),
                                          Text('${widget.dropoff ?? '----'}',
                                              style:
                                                  BookingText.helvetica16bold),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 25),
                            Padding(
                              padding: const EdgeInsets.only(left: 60),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 300,
                                    child: Divider(
                                      thickness: 1,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            Padding(
                              padding: EdgeInsets.only(left: 80),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('User',
                                          style: BookingText.helvetica21bold),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.black,
                                        child: CircleAvatar(
                                          radius: 17.5,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('${widget.user ?? '----'}',
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                fontFamily: 'Helvetica',
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Operator',
                                          style: BookingText.helvetica21bold)
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.black,
                                        child: CircleAvatar(
                                          radius: 17.5,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('${widget.operName ?? '----'}',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontFamily: 'Helvetica')),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Padding(
                          padding: EdgeInsets.only(top: 2.h, bottom: 4.h),
                          child: Column(
                            children: [
                              Container(
                                height: 450,
                                child: VerticalDivider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 65),
                          child: Column(
                            children: [
                              Text("Shipment details",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Helvetica',
                                      fontSize: 17,
                                      color: Colors.black)),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Container(
                                  height: 67,
                                  width: 320,
                                  padding: EdgeInsets.only(
                                      left: 17, right: 10, top: 10, bottom: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Color.fromRGBO(183, 183, 183, 1)),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Mode',
                                              style: DetailsText.helvetica),
                                          Text('${widget.truck ?? '----'}',
                                              style: DetailsText.helvetica20),
                                        ],
                                      ),
                                      Image.network(
                                          'https://firebasestorage.googleapis.com/v0/b/naqli-5825c.appspot.com/o/detailimage1.png?alt=media&token=bbea2e2b-99a3-406b-a58f-95723347923e'),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Container(
                                  height: 67,
                                  width: 320,
                                  padding: EdgeInsets.only(
                                      left: 17, right: 10, top: 10, bottom: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Color.fromRGBO(183, 183, 183, 1)),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Load',
                                              style: DetailsText.helvetica),
                                          Text('${widget.load ?? '----'}',
                                              style: DetailsText.helvetica20),
                                        ],
                                      ),
                                      Image.network(
                                          'https://firebasestorage.googleapis.com/v0/b/naqli-5825c.appspot.com/o/detailimage2.png?alt=media&token=2bf4a9e0-61d8-4fb2-b041-4675a61a7c6f'),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Container(
                                  height: 67,
                                  width: 320,
                                  padding: EdgeInsets.only(
                                      left: 17, right: 10, top: 10, bottom: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Color.fromRGBO(183, 183, 183, 1)),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Distance',
                                              style: DetailsText.helvetica),
                                          Text('50km',
                                              style: DetailsText.helvetica20),
                                        ],
                                      ),
                                      Image.network(
                                          'https://firebasestorage.googleapis.com/v0/b/naqli-5825c.appspot.com/o/detailimage3.png?alt=media&token=d70311ff-47d8-46ee-b6ea-86f01d3243b3'),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Container(
                                  height: 67,
                                  width: 320,
                                  padding: EdgeInsets.only(
                                      left: 17, right: 10, top: 10, bottom: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Color.fromRGBO(183, 183, 183, 1)),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Additional',
                                              style: DetailsText.helvetica),
                                          Text('Labour',
                                              style: DetailsText.helvetica),
                                          Text('${widget.labour ?? '----'}',
                                              style: DetailsText.helvetica20),
                                        ],
                                      ),
                                      Image.network(
                                          'https://firebasestorage.googleapis.com/v0/b/naqli-5825c.appspot.com/o/detailimage4.png?alt=media&token=3eb269fc-38ee-450f-8a91-c618ff32319d'),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Container(
                                  height: 67,
                                  width: 320,
                                  padding: EdgeInsets.only(
                                      left: 17, right: 10, top: 10, bottom: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Color.fromRGBO(183, 183, 183, 1)),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('value of the product',
                                              style: DetailsText.helvetica),
                                          Text(
                                              '${widget.productValue ?? '----'}',
                                              style: DetailsText.helvetica20),
                                        ],
                                      ),
                                      Image.network(
                                          'https://firebasestorage.googleapis.com/v0/b/naqli-5825c.appspot.com/o/detailimage5.png?alt=media&token=b74aac86-746a-4e1d-a4d2-f515f91ff840'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 30),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 65),
                          child: Column(
                            children: [
                              Text("Quote Price",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Helvetica',
                                      fontSize: 17,
                                      color: Colors.black)),
                              SizedBox(height: 10),
                              Container(
                                height: 370,
                                width: 290,
                                padding: EdgeInsets.only(
                                  left: 1.w,
                                  right: 1.w,
                                  top: 7.h,
                                  bottom: 2.h,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(183, 183, 183, 1)),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text('Unit Fare :',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: 'Helvetica',
                                                  color: Colors.black,
                                                ))
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width:
                                                  110, // Set the desired width
                                              height:
                                                  23, // Set the desired height
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors
                                                      .black, // Set the border color here
                                                  width:
                                                      1.0, // Set the border width here
                                                ),
                                              ),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  hintText:
                                                      '', // Add any hint text if needed
                                                  border: InputBorder
                                                      .none, // Remove the border from the TextField itself
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text('Additional Labour :',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: 'Helvetica',
                                                  color: Colors.black,
                                                ))
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width:
                                                  110, // Set the desired width
                                              height:
                                                  23, // Set the desired height
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors
                                                      .black, // Set the border color here
                                                  width:
                                                      1.0, // Set the border width here
                                                ),
                                              ),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  hintText:
                                                      '', // Add any hint text if needed
                                                  border: InputBorder
                                                      .none, // Remove the border from the TextField itself
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text('Service Charge :',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: 'Helvetica',
                                                  color: Colors.black,
                                                )),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text('XXXXX',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: 'Helvetica',
                                                  color: Colors.black,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 140),
                                    Padding(
                                      padding: EdgeInsets.only(left: 2.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text('Total ',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontFamily: 'Helvetica',
                                                      color: Color.fromRGBO(
                                                          124, 7, 145, 1))),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text('XXXXX SAR',
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      fontFamily: 'Helvetica',
                                                      color: Color.fromRGBO(
                                                          124, 7, 145, 1))),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 33.h, bottom: 1.7.w),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Add your action for the first button
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(99, 194, 109, 1),
                              foregroundColor: Colors.white,
                              minimumSize: Size(230, 55), // Set desired size
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text('Send Quote',
                                style: TextStyle(
                                    fontSize: 22.0, fontFamily: 'Helvetica')),
                          ),
                          SizedBox(width: 80),
                          ElevatedButton(
                            onPressed: () {
                              // Add your action for the second button
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(227, 22, 22, 1),
                              foregroundColor: Colors.white,
                              minimumSize: Size(230, 55), // Set desired size
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text('Decline Booking',
                                style: TextStyle(
                                  fontSize: 22.0,
                                )),
                          ),
                        ],
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
