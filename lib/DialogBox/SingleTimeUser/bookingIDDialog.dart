import 'package:flutter/material.dart';
import 'package:flutter_application_1/Users/SingleTimeUser/bookingPage.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/formText.dart';

class BookingIDDialog extends StatefulWidget {
  @override
  _BookingIDDialogState createState() => _BookingIDDialogState();
}

class _BookingIDDialogState extends State<BookingIDDialog> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 650) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width *
                  0.5, // Adjust width responsively
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 0.1, // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                      color: Color.fromRGBO(98, 105, 254, 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('Booking ID ***************',
                                  style: DialogText.helvetica21),
                            ),
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.only(right: 2),
                          icon: Icon(Icons.close),
                          onPressed: () {
                            // Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookingPage(),
                              ),
                            );
                          },
                          color: Colors.white, // Setting icon color
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text('Booking Generated',
                            style: DialogText.helvetica40),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width *
                  0.6, // Adjust width responsively
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 0.1, // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      color: Color.fromRGBO(98, 106, 254, 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Booking ID',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Helvetica',
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.only(right: 2),
                              icon: Icon(Icons.close),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'XXXXXXXXXXXXXXXXXX',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Helvetica',
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0)),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          'Booking Generated',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(116, 97, 97, 1),
                              fontFamily: 'Helvetica',
                              fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      });
    });
  }
}
