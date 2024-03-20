import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Partner extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Partner> {
  late int _selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 1180) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(100.0),
                child: AppBar(
                    centerTitle: false,
                    title: Container(
                      padding: const EdgeInsets.only(left: 380, top: 15),
                      child: Image.asset(
                        'Naqli-final-logo.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: EdgeInsets.only(right: 410, top: 10),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              child: Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  "User",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.brown[100]),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: SizedBox(
                                height: 30,
                                child: VerticalDivider(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  "Partner",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            SizedBox(width: 300),
                            SizedBox(
                              height: 40,
                              child: Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.notifications),
                                  color: Colors.blue[900], // Bell icon
                                ),
                              ),
                            ),
                            SizedBox(width: 1),
                            SizedBox(
                              height: 30,
                              child: Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  "Contact us",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: SizedBox(
                                height: 30,
                                child: VerticalDivider(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              height: 30,
                              child: Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  "Hello Customer",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
              body: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        height: 460,
                        width: 1930,
                        color: Color.fromRGBO(106, 102, 209, 1),
                      ),
                      Container(
                        height: 360,
                        width: 1930,
                        color: Colors.brown[50],
                      ),
                    ],
                  ),
                  Positioned(
                    top: 130,
                    left: 642,
                    right: 732,
                    child: Container(
                      height: 530,
                      width: 90,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: 546,
                                color: Color.fromRGBO(142, 151, 160, 1),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text('Join Us',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                      textAlign: TextAlign.center),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 43),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                      value: 1,
                                      groupValue: _selectedValue,
                                      onChanged: (int? value) {
                                        setState(() {
                                          _selectedValue = value ??
                                              0; // Use null-aware operator to handle null value
                                          print(
                                              'Selected value: $_selectedValue');
                                        });
                                      },
                                    ),
                                    Text('Enterprise')
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: 2,
                                      groupValue: _selectedValue,
                                      onChanged: (int? value) {
                                        setState(() {
                                          _selectedValue = value ??
                                              0; // Use null-aware operator to handle null value
                                          print(
                                              'Selected value: $_selectedValue');
                                        });
                                      },
                                    ),
                                    Text('Multiple Units'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: 3,
                                      groupValue: _selectedValue,
                                      onChanged: (int? value) {
                                        setState(() {
                                          _selectedValue = value ??
                                              0; // Use null-aware operator to handle null value
                                          print(
                                              'Selected value: $_selectedValue');
                                        });
                                      },
                                    ),
                                    Text('Operator/Owner')
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: 4,
                                      groupValue: _selectedValue,
                                      onChanged: (int? value) {
                                        setState(() {
                                          _selectedValue = value ??
                                              0; // Use null-aware operator to handle null value
                                          print(
                                              'Selected value: $_selectedValue');
                                        });
                                      },
                                    ),
                                    Text('Operator')
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 90),
                          Padding(
                            padding: EdgeInsets.only(left: 117),
                            child: Row(
                              children: [
                                Text('Name',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 117),
                                child: SizedBox(
                                  height: 35,
                                  width: 305,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Enter Your name',
                                      contentPadding: EdgeInsets.all(5.0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 117),
                            child: Row(
                              children: [
                                Text('Mobile No',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 117),
                                child: SizedBox(
                                  height: 35,
                                  width: 305,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Enter Your Mobile No',
                                      contentPadding: EdgeInsets.all(5.0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      suffixIcon: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromRGBO(
                                              60,
                                              55,
                                              148,
                                              1), // Set button color to blue
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                0), // Make button shape square
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Text('Verify'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 117),
                            child: Row(
                              children: [
                                Text('Email (Optional)',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 117),
                                child: SizedBox(
                                  height: 35,
                                  width: 305,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Enter Your Email',
                                      contentPadding: EdgeInsets.all(5.0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25),
                          Row(children: [
                            Padding(
                              padding: EdgeInsets.only(left: 160),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromRGBO(128, 123, 229,
                                      1), // Set button color to blue
                                  foregroundColor: Colors.white,
                                  minimumSize: Size(230, 50), // Set button size
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10), // Set button shape to rounded rectangle
                                  ),
                                ),
                                onPressed: () {},
                                child: Text('Register'),
                              ),
                            ),
                          ])
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(70),
                  child: AppBar(
                      centerTitle: false,
                      title: Container(
                        padding: const EdgeInsets.only(left: 5, top: 5),
                        child: Image.asset(
                          'Naqli-final-logo.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: EdgeInsets.only(right: 16, top: 5),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 20,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "User",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.brown[100]),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: SizedBox(
                                  height: 20,
                                  child: VerticalDivider(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "Partner",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                height: 20,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.notifications),
                                  color: Colors.blue[900], // Bell icon
                                  padding: EdgeInsets.zero, // No padding
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "Contect us",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: SizedBox(
                                  height: 20,
                                  child: VerticalDivider(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "Hello Customer",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5),
                      ]),
                ),
                body: SingleChildScrollView(
                  // Wrap with SingleChildScrollView
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 53.h,
                            width: 100.w,
                            color: Colors.blue[900],
                          ),
                          Container(
                            height: 40.h,
                            width: 100.w,
                            color: Colors.brown[50],
                          ),
                        ],
                      ),
                      Positioned(
                        top: 90,
                        left: 30,
                        right: 30,
                        child: Container(
                          height: 450,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(31),
                              bottomRight: Radius.circular(31),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 6.h,
                                    child: Container(
                                      color: Colors.blueGrey[400],
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text('Join Us',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                            textAlign: TextAlign.center),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: _selectedValue,
                                        onChanged: (int? value) {
                                          setState(() {
                                            _selectedValue = value ??
                                                0; // Use null-aware operator to handle null value
                                            print(
                                                'Selected value: $_selectedValue');
                                          });
                                        },
                                      ),
                                      Text('Enterprice')
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: 2,
                                        groupValue: _selectedValue,
                                        onChanged: (int? value) {
                                          setState(() {
                                            _selectedValue = value ??
                                                0; // Use null-aware operator to handle null value
                                            print(
                                                'Selected value: $_selectedValue');
                                          });
                                        },
                                      ),
                                      Text('Multiple Units'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: 3,
                                        groupValue: _selectedValue,
                                        onChanged: (int? value) {
                                          setState(() {
                                            _selectedValue = value ??
                                                0; // Use null-aware operator to handle null value
                                            print(
                                                'Selected value: $_selectedValue');
                                          });
                                        },
                                      ),
                                      Text('Operator/Owner')
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: 4,
                                        groupValue: _selectedValue,
                                        onChanged: (int? value) {
                                          setState(() {
                                            _selectedValue = value ??
                                                0; // Use null-aware operator to handle null value
                                            print(
                                                'Selected value: $_selectedValue');
                                          });
                                        },
                                      ),
                                      Text('owner')
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 60),
                              Padding(
                                padding: EdgeInsets.only(left: 260),
                                child: Row(
                                  children: [
                                    Text('Name',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 260),
                                    child: SizedBox(
                                      height: 35,
                                      width: 400,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Enter Your name',
                                          contentPadding: EdgeInsets.all(5.0),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: EdgeInsets.only(left: 260),
                                child: Row(
                                  children: [
                                    Text('Mobile No',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 260),
                                    child: SizedBox(
                                      height: 35,
                                      width: 400,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Enter Your Mobile No',
                                          contentPadding: EdgeInsets.all(5.0),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                          ),
                                          suffixIcon: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blue[
                                                  900], // Set button color to blue
                                              foregroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    0), // Make button shape square
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Text('Verify'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: EdgeInsets.only(left: 260),
                                child: Row(
                                  children: [
                                    Text('Email (Opational)',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 260),
                                    child: SizedBox(
                                      height: 35,
                                      width: 400,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Enter Your Email',
                                          contentPadding: EdgeInsets.all(5.0),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 285),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.indigo[
                                          800], // Set button color to blue
                                      foregroundColor: Colors.white,
                                      minimumSize:
                                          Size(230, 50), // Set button size
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10), // Set button shape to rounded rectangle
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text('Register'),
                                  ),
                                ),
                              ])
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        }
      });
    });
  }
}
