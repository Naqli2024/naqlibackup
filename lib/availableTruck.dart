import 'package:flutter/material.dart';

class AvailabeTruckList extends StatefulWidget {
  AvailabeTruckList();

  @override
  State<AvailabeTruckList> createState() => _AvailabeTruckList();
}

class _AvailabeTruckList extends State<AvailabeTruckList> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(96.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 300, right: 300, top: 20),
            child: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: false,
              elevation: 0.0,
              title: Image.asset(
                'Naqli-final-logo.png',
                width: 140,
                height: 140,
              ),
              actions: [
                Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Color.fromRGBO(106, 102, 209, 1),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Contact us',
                      style: TextStyle(
                        fontFamily: 'Colfax',
                        fontSize: 16,
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
                      width: 10,
                    ),
                    Text(
                      'Hello Customer!',
                      style: TextStyle(
                        fontFamily: 'Colfax',
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 40),
                    SizedBox(width: 8.0),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 468,
                  width: double.infinity,
                  color: Color.fromARGB(255, 128, 123, 229),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 23),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Available Vehicle',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Colfax',
                            fontSize: 25,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 200,
                )
              ],
            ),
            Positioned(
              left: 370,
              top: 80,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        blurRadius: 2, // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                width: 1150,
                height: 740,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 50, bottom: 50, left: 45, right: 45),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  )),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'delivery-truck.png',
                                    width: 150,
                                    height: 150,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 15, right: 60),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Vehicle 1',
                                          style: TextStyle(
                                              fontFamily: 'Colfax',
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Upto 500 kg / Goods for small Parcels',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Colfax',
                                              fontSize: 14),
                                        ),
                                        Text(
                                          'Starting from XXX',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Colfax',
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  )),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'delivery-truck.png',
                                    width: 150,
                                    height: 150,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 15, right: 60),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Vehicle 2',
                                          style: TextStyle(
                                              fontFamily: 'Colfax',
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Upto 500 kg / Goods for small Parcels',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Colfax',
                                              fontSize: 14),
                                        ),
                                        Text(
                                          'Starting from XXX',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Colfax',
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  )),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'delivery-truck.png',
                                    width: 150,
                                    height: 150,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 15, right: 60),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Vehicle 3',
                                          style: TextStyle(
                                              fontFamily: 'Colfax',
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Upto 500 kg / Goods for small Parcels',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Colfax',
                                              fontSize: 14),
                                        ),
                                        Text(
                                          'Starting from XXX',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Colfax',
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  )),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'delivery-truck.png',
                                    width: 150,
                                    height: 150,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 15, right: 60),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Vehicle 4',
                                          style: TextStyle(
                                              fontFamily: 'Colfax',
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Upto 500 kg / Goods for small Parcels',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Colfax',
                                              fontSize: 14),
                                        ),
                                        Text(
                                          'Starting from XXX',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Colfax',
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        height: 660,
                        child: VerticalDivider(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors
                                        .black, // Specify the border width
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  )),
                              width: 470,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: Colors.green,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors
                                        .black, // Specify the border width
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  )),
                              width: 470,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: Colors.red,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors
                                        .black, // Specify the border width
                                  ),
                                  color: Color.fromARGB(69, 112, 106, 106),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  )),
                              width: 470,
                              height: 500,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
