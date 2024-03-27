import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class Operator extends StatefulWidget {
  const Operator();

  @override
  _OperatorState createState() => _OperatorState();
}

class _OperatorState extends State<Operator> {
  final _formKey = GlobalKey<FormState>();

  List<String> cities = ['City 1', 'City 2', 'City 3', 'City 4'];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? selectedCity;
  String? selectedType;
  String? selectedOption;
  bool isVerified = false;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController govtIdController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController alternateNumberController = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController accounttypeController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  void showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(errorMessage),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  Future<void> _saveUserDataToFirestore() async {
    print("track2");
    try {
      CollectionReference usersCollection = _firestore.collection('users');

      await usersCollection.add({
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'phoneNumber': contactNumberController.text,
        'address': addressController.text,
        'city': selectedCity,
        'govtId': selectedOption,
        'confirmPassword': confirmPasswordController.text,
        'alternateNumber': alternateNumberController.text,
        'address2': address2Controller.text,
        'accountType': selectedType,
        'idNumber': idNumberController.text,
      });

      print('User data saved to Firestore successfully!');
    } catch (e) {
      print('Error saving user data to Firestore: $e');
    }
  }

  Future<void> _startPhoneAuth(String phoneNumber) async {
    print("track3");

    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: "+91${contactNumberController.text}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential).then((value) {
            Navigator.pop(context);
            setState(() {
              isVerified = true;
            });
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          // Handle the verification failure
          print('Phone authentication failed: $e');
        },
        codeSent: (String verificationId, [int? forceResendingToken]) {
          // Store the verification ID for later use (e.g., resend OTP)
          String storedVerificationId = verificationId;

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: Text("Enter OTP"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: otpController,
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    String smsCode = otpController.text;
                    PhoneAuthCredential _credential =
                        PhoneAuthProvider.credential(
                      verificationId: storedVerificationId,
                      smsCode: smsCode,
                    );

                    auth.signInWithCredential(_credential).then((result) {
                      // Check if the verification is successful
                      if (result.user != null) {
                        print("otp verified successfully");

                        setState(() {
                          isVerified = true;
                        });
                      } else {
                        showErrorDialog(
                            "Invalid verification code. Please enter the correct code.");
                      }
                    }).catchError((e) {
                      print("Error signing in with credential: $e");
                    });
                  },
                  child: Text("Done"),
                ),
              ],
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle code auto retrieval timeout (optional)
        },
      );
    } catch (e) {
      print('Error during phone authentication: $e');
    }
  }

  void _showOtpVerificationDialog() {
    print("track4");

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Verification"),
          content: Column(
            children: [
              Text("Enter OTP"),
              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'OTP',
                ),
              ),
            ],
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            InkWell(
              onTap: () async {
                // Validate OTP and proceed if valid
                String enteredOtp = otpController.text;
                if (enteredOtp.isNotEmpty) {
                  // You can add OTP validation logic here
                  // If the OTP is valid, you can perform further actions
                  // For now, let's just close the dialog
                  Navigator.of(context).pop();
                } else {
                  // Handle case where OTP is empty
                }
              },
              child: Text("Verify"),
            ),
          ],
        );
      },
    );
  }

  bool isValidName(String name) {
    final RegExp nameRegExp = RegExp(r"^[A-Za-z']+([- ][A-Za-z']+)*$");
    return nameRegExp.hasMatch(name);
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '*Required';
    } else if (!isValidName(value)) {
      return 'Invalid format';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '*Required';
    } else if (!isValidEmail(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? validatePassword(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 900) {
          return Dialog(
            child: Container(
              width: 1100,
              height: 750,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(31),
                  bottomLeft: Radius.circular(31),
                  topRight: Radius.circular(31),
                  bottomRight: Radius.circular(31),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 100, right: 100, top: 50, bottom: 45),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Text(
                          'Driver/Owner',
                          style: TextStyle(
                              fontFamily: 'HelveticaNeueRegular',
                              fontSize: 44,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(106, 102, 209, 1)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Colfax',
                            ),
                          ),
                          SizedBox(width: 95),
                          Expanded(
                            child: SizedBox(
                              height: 45,
                              child: TextFormField(
                                controller: firstNameController,
                                validator: nameValidator,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Helvetica",
                                      color: Color.fromRGBO(133, 139, 145, 1)),
                                  hintText: 'First Name',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2.0, horizontal: 10.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 25),
                          Expanded(
                            child: SizedBox(
                              height: 45,
                              child: TextFormField(
                                controller: lastNameController,
                                validator: nameValidator,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Helvetica",
                                      color: Color.fromRGBO(133, 139, 145, 1)),
                                  hintText: 'Last Name',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2.0, horizontal: 10.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text('Email ID',
                              style: TextStyle(
                                  fontFamily: 'Colfax', fontSize: 16)),
                          SizedBox(width: 78),
                          Expanded(
                            child: SizedBox(
                              height: 45,
                              child: TextFormField(
                                controller: emailController,
                                validator: emailValidator,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Helvetica",
                                      color: Color.fromRGBO(133, 139, 145, 1)),
                                  hintText: 'Email address',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2.0, horizontal: 10.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Mobile No', style: TextStyle(fontSize: 16)),
                              SizedBox(
                                height: 40,
                              ),
                              Text('Date of birth',
                                  style: TextStyle(fontSize: 16)),
                              SizedBox(
                                height: 40,
                              ),
                              Text('Unit Type', style: TextStyle(fontSize: 16)),
                              SizedBox(
                                height: 40,
                              ),
                              Text('Driving License',
                                  style: TextStyle(fontSize: 16)),
                              SizedBox(
                                height: 40,
                              ),
                              Text('National ID',
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 45,
                                  child: TextFormField(
                                    controller: passwordController,
                                    validator: validatePassword,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Helvetica",
                                          color:
                                              Color.fromRGBO(133, 139, 145, 1)),
                                      hintText: 'Enter your mobile no',
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 2.0, horizontal: 10.0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 45,
                                  child: TextFormField(
                                    controller: contactNumberController,
                                    validator: (value) {
                                      if (value!.length != 10)
                                        return 'Mobile Number must be of 10 digit';
                                      else
                                        return null;
                                    },
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Helvetica",
                                          color:
                                              Color.fromRGBO(133, 139, 145, 1)),
                                      hintText: 'DD/MM/YYYY',
                                      labelText: 'Date of birth',
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 2.0, horizontal: 10.0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 45,
                                  child: DropdownButtonFormField<String>(
                                    value: selectedOption,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 2.0, horizontal: 10.0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedOption = newValue;
                                      });
                                    },
                                    items: [
                                      DropdownMenuItem<String>(
                                        value: 'Vehicle',
                                        child: Text('Vehicle'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Bus',
                                        child: Text('Bus'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Equipment',
                                        child: Text('Equipment'),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 45,
                                  width: 160,
                                  child: Expanded(
                                    child: ElevatedButton(
                                      child: Text(
                                        'Upload a file',
                                        style: TextStyle(
                                            color: Color.fromRGBO(20, 3, 3, 1)),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        elevation: 2,
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 45,
                                  width: 160,
                                  child: Expanded(
                                    child: ElevatedButton(
                                      child: Text(
                                        'Upload a file',
                                        style: TextStyle(
                                            color: Color.fromRGBO(20, 3, 3, 1)),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        elevation: 2,
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Iqama No.', style: TextStyle(fontSize: 16)),
                              SizedBox(
                                height: 40,
                              ),
                              Text('Panel Information',
                                  style: TextStyle(fontSize: 16)),
                              SizedBox(
                                height: 40,
                              ),
                              Text('Classification',
                                  style: TextStyle(fontSize: 16)),
                              SizedBox(
                                height: 30,
                              ),
                              Text('ID Copy', style: TextStyle(fontSize: 16)),
                              SizedBox(
                                height: 34,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Picture of',
                                      style: TextStyle(fontSize: 15)),
                                  Text('Equipment/Vehicle',
                                      style: TextStyle(fontSize: 15)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 45,
                                  child: TextFormField(
                                    validator: validatePassword,
                                    controller: confirmPasswordController,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Helvetica",
                                          color:
                                              Color.fromRGBO(133, 139, 145, 1)),
                                      hintText: 'XXXXXXXXXX',
                                      contentPadding: EdgeInsets.all(5.0),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 45,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.length != 10)
                                        return 'Mobile Number must be of 10 digit';
                                      else
                                        return null;
                                    },
                                    controller: alternateNumberController,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Helvetica",
                                          color:
                                              Color.fromRGBO(133, 139, 145, 1)),
                                      hintText: 'XXXXXXXXXX',
                                      contentPadding: EdgeInsets.all(5.0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 45,
                                        child: DropdownButtonFormField<String>(
                                          value: selectedOption,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(5.0),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                            ),
                                          ),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedOption = newValue;
                                            });
                                          },
                                          items: [
                                            DropdownMenuItem<String>(
                                              value: 'Vehicle',
                                              child: Text('Vehicle'),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: 'Bus',
                                              child: Text('Bus'),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: 'Equipment',
                                              child: Text('Equipment'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // Adjust the space between the dropdown and the icon
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 45,
                                  width: 160,
                                  child: Expanded(
                                    child: ElevatedButton(
                                      child: Text(
                                        'Upload a file',
                                        style: TextStyle(
                                            color: Color.fromRGBO(20, 3, 3, 1)),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        elevation: 2,
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 45,
                                  width: 160,
                                  child: Expanded(
                                    child: ElevatedButton(
                                      child: Text(
                                        'Upload a file',
                                        style: TextStyle(
                                            color: Color.fromRGBO(20, 3, 3, 1)),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        elevation: 2,
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 27,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 45,
                            width: 200,
                            child: Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    print("track1");
                                    await _startPhoneAuth(
                                        contactNumberController.text);
                                    // _showOtpVerificationDialog();
                                    // Save user data and start phone authentication
                                    await _saveUserDataToFirestore();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 128, 123, 229),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                        fontFamily: 'Colfax',
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Dialog(
              child: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(31),
                  bottomLeft: Radius.circular(31),
                  topRight: Radius.circular(31),
                  bottomRight: Radius.circular(31),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 2.5.h, right: 2.5.h, top: 3.w, bottom: 3.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          'Driver/Owner',
                          style: TextStyle(
                            fontFamily: 'ColfaxBold',
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(width: 150, child: Text('First Name ')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: firstNameController,
                                validator: nameValidator,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 12),
                                  hintText: 'First Name',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2.0,
                                      horizontal:
                                          10.0), // Adjust padding as needed
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 150, child: Text('Last Name')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: lastNameController,
                                validator: nameValidator,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 12),
                                  hintText: 'Last Name',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2.0, horizontal: 10.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 150, child: Text('Email ID')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: emailController,
                                validator: emailValidator,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 12),
                                  hintText: 'Email address',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2.0, horizontal: 10.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 150, child: Text('Mobile No')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 12),
                                  hintText: 'Enter your mobile no',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2.0, horizontal: 10.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 150, child: Text('Iqama No')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 12),
                                  hintText: 'XXXXXXXXXX',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2.0, horizontal: 10.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 150, child: Text('Date of birth')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 12),
                                  hintText: 'DD/MM/YYYY',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2.0, horizontal: 10.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                              width: 150, child: Text('Panel Information')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 12),
                                  hintText: 'XXXXXXXXXX',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2.0, horizontal: 10.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 150, child: Text('Unit Type')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: DropdownButtonFormField<String>(
                                value: selectedOption,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedOption = newValue;
                                  });
                                },
                                items: [
                                  DropdownMenuItem<String>(
                                    value: 'Vehicle',
                                    child: Text('Vehicle'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Bus',
                                    child: Text('Bus'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Equipment',
                                    child: Text('Equipment'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 150, child: Text('Classification')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: DropdownButtonFormField<String>(
                                value: selectedOption,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedOption = newValue;
                                  });
                                },
                                items: [
                                  DropdownMenuItem<String>(
                                    value: 'Vehicle',
                                    child: Text('Vehicle'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Bus',
                                    child: Text('Bus'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Equipment',
                                    child: Text('Equipment'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 150, child: Text('Driving License')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              width: 160,
                              child: Expanded(
                                child: ElevatedButton(
                                  child: Text(
                                    'Upload a file',
                                    style: TextStyle(
                                        color: Color.fromRGBO(20, 3, 3, 1)),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 2,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 150, child: Text('ID Copy')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              width: 160,
                              child: Expanded(
                                child: ElevatedButton(
                                  child: Text(
                                    'Upload a file',
                                    style: TextStyle(
                                        color: Color.fromRGBO(20, 3, 3, 1)),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 2,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 150, child: Text('National ID')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              width: 160,
                              child: Expanded(
                                child: ElevatedButton(
                                  child: Text(
                                    'Upload a file',
                                    style: TextStyle(
                                        color: Color.fromRGBO(20, 3, 3, 1)),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 2,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Picture of',
                                    style: TextStyle(fontSize: 15)),
                                Text('Equipment/Vehicle',
                                    style: TextStyle(fontSize: 15)),
                              ],
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              width: 160,
                              child: Expanded(
                                child: ElevatedButton(
                                  child: Text(
                                    'Upload a file',
                                    style: TextStyle(
                                        color: Color.fromRGBO(20, 3, 3, 1)),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 2,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  print("track1");
                                  await _startPhoneAuth(
                                      contactNumberController.text);
                                  // _showOtpVerificationDialog();
                                  // Save user data and start phone authentication
                                  await _saveUserDataToFirestore();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize:
                                    const Size.fromWidth(double.infinity),
                                backgroundColor:
                                    Color.fromARGB(255, 128, 123, 229),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      5), // Adjust border radius as needed
                                ),
                              ),
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  fontFamily: 'Colfax',
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )));
        }
      });
    });
  }
}
