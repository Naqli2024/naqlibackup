import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Users/SingleUser/dashboard_page.dart';

import 'package:flutter_application_1/loginPage.dart';
import 'package:sizer/sizer.dart';

class SingleuserCreateAccount1 extends StatefulWidget {
  const SingleuserCreateAccount1();

  @override
  _SingleuserCreateAccountState createState() =>
      _SingleuserCreateAccountState();
}

class _SingleuserCreateAccountState extends State<SingleuserCreateAccount1> {
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SingleUserDashboardPage(),
                          ),
                        );
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
        if (constraints.maxWidth >= 650) {
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
                padding:
                    EdgeInsets.only(left: 5.w, right: 5.w, top: 50, bottom: 45),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Create your account',
                        style: TextStyle(
                          fontFamily: 'ColfaxBold',
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('First Name '),
                          SizedBox(width: 75),
                          Expanded(
                            child: SizedBox(
                              height: 45,
                              width: 100,
                              child: TextFormField(
                                controller: firstNameController,
                                validator: nameValidator,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 16),
                                  hintText: 'First Name',
                                  contentPadding: EdgeInsets.all(5.0),
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
                                  hintStyle: TextStyle(fontSize: 16),
                                  hintText: 'Last Name',
                                  contentPadding: EdgeInsets.all(5.0),
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
                          Text('Email Address',
                              style: TextStyle(
                                  fontFamily: 'Colfax', fontSize: 16)),
                          SizedBox(width: 40),
                          Expanded(
                            child: SizedBox(
                              height: 45,
                              child: TextFormField(
                                controller: emailController,
                                validator: emailValidator,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 16),
                                  hintText: 'Email address',
                                  contentPadding: EdgeInsets.all(5.0),
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
                              Text('Password', style: TextStyle(fontSize: 16)),
                              SizedBox(
                                height: 40,
                              ),
                              Text('Contact Number',
                                  style: TextStyle(fontSize: 16)),
                              SizedBox(
                                height: 40,
                              ),
                              Text('Address 1', style: TextStyle(fontSize: 16)),
                              SizedBox(
                                height: 40,
                              ),
                              Text('City', style: TextStyle(fontSize: 16)),
                              SizedBox(
                                height: 40,
                              ),
                              Text('Govt ID', style: TextStyle(fontSize: 16)),
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
                                      hintStyle: TextStyle(fontSize: 16),
                                      hintText: 'Password',
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
                                      hintStyle: TextStyle(fontSize: 16),
                                      hintText: 'Phone Number',
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
                                SizedBox(
                                  height: 45,
                                  child: TextFormField(
                                    controller: addressController,
                                    validator: nameValidator,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(fontSize: 16),
                                      hintText: 'Address',
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
                                SizedBox(
                                  height: 45,
                                  child: DropdownButtonFormField(
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(5.0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                    ),
                                    value: selectedCity,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedCity = newValue;
                                      });
                                    },
                                    items: cities.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value,
                                            style: TextStyle(fontSize: 14)),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 45,
                                  child: DropdownButtonFormField<String>(
                                    isExpanded: true,
                                    value: selectedOption,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(5.0),
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
                                        value: 'National ID',
                                        child: Text('National ID',
                                            style: TextStyle(fontSize: 14)),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Iqama No.',
                                        child: Text('Iqama No.',
                                            style: TextStyle(fontSize: 14)),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Visit Visa / Border No',
                                        child: Text('Visit Visa / Border No',
                                            style: TextStyle(fontSize: 14)),
                                      ),
                                    ],
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
                              Text('Confirm Password',
                                  style: TextStyle(fontSize: 16)),
                              SizedBox(
                                height: 40,
                              ),
                              Text('Alternate Number',
                                  style: TextStyle(fontSize: 16)),
                              SizedBox(
                                height: 40,
                              ),
                              Text('Address 2', style: TextStyle(fontSize: 16)),
                              SizedBox(
                                height: 40,
                              ),
                              Text('Account Type',
                                  style: TextStyle(fontSize: 16)),
                              SizedBox(
                                height: 40,
                              ),
                              Text('ID Number', style: TextStyle(fontSize: 16)),
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
                                      hintStyle: TextStyle(fontSize: 16),
                                      hintText: 'Password',
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
                                      hintStyle: TextStyle(fontSize: 16),
                                      hintText: 'Phone Number',
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
                                SizedBox(
                                  height: 45,
                                  child: TextFormField(
                                    validator: nameValidator,
                                    controller: address2Controller,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(fontSize: 16),
                                      hintText: 'Address',
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
                                SizedBox(
                                  height: 45,
                                  child: DropdownButtonFormField<String>(
                                    isExpanded: true,
                                    value: selectedType,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(5.0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedType = newValue;
                                      });
                                    },
                                    items: [
                                      DropdownMenuItem<String>(
                                        value: 'User',
                                        child: Text('User',
                                            style: TextStyle(fontSize: 14)),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'SuperUser',
                                        child: Text('SuperUser',
                                            style: TextStyle(fontSize: 14)),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Enterprise',
                                        child: Text('Enterprise',
                                            style: TextStyle(fontSize: 14)),
                                      ),
                                    ],
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
                                    controller: idNumberController,
                                    decoration: InputDecoration(
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
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 45,
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
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                  fontFamily: 'Colfax',
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          SizedBox(
                            height: 45,
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
                                    Color.fromARGB(112, 112, 112, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      5), // Adjust border radius as needed
                                ),
                              ),
                              child: Text(
                                'Cancel',
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
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account? '),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return LoginPage();
                                },
                              );
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
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
                          'Create your account',
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
                                  hintStyle: TextStyle(fontSize: 15),
                                  hintText: 'First Name',
                                  contentPadding: EdgeInsets.all(2.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2.0)),
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
                                  hintStyle: TextStyle(fontSize: 15),
                                  hintText: 'Last Name',
                                  contentPadding: EdgeInsets.all(1.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2.0)),
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
                          SizedBox(width: 150, child: Text('Email Address')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: emailController,
                                validator: emailValidator,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 15),
                                  hintText: 'Email address',
                                  contentPadding: EdgeInsets.all(2.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2)),
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
                          SizedBox(width: 150, child: Text('Password')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: emailController,
                                validator: emailValidator,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 15),
                                  hintText: 'Password',
                                  contentPadding: EdgeInsets.all(2.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2)),
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
                          SizedBox(width: 150, child: Text('Confirm Password')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: emailController,
                                validator: emailValidator,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 15),
                                  hintText: 'Password',
                                  contentPadding: EdgeInsets.all(2.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2)),
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
                          SizedBox(width: 150, child: Text('Contact Number')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: contactNumberController,
                                validator: (value) {
                                  if (value!.length != 10)
                                    return 'Mobile Number must be of 10 digit';
                                  else
                                    return null;
                                },
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 15),
                                  hintText: 'Phone Number',
                                  contentPadding: EdgeInsets.all(5.0),
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
                          SizedBox(width: 150, child: Text('Alternate Number')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.length != 10)
                                    return 'Mobile Number must be of 10 digit';
                                  else
                                    return null;
                                },
                                controller: alternateNumberController,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 15),
                                  hintText: 'Phone Number',
                                  contentPadding: EdgeInsets.all(5.0),
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
                          SizedBox(width: 150, child: Text('Address 1')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: addressController,
                                validator: nameValidator,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 15),
                                  hintText: 'Address',
                                  contentPadding: EdgeInsets.all(5.0),
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
                          SizedBox(width: 150, child: Text('Address 2')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: addressController,
                                validator: nameValidator,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 15),
                                  hintText: 'Address',
                                  contentPadding: EdgeInsets.all(5.0),
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
                          SizedBox(width: 150, child: Text('Çity')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                                value: selectedCity,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedCity = newValue;
                                  });
                                },
                                items: cities.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 150, child: Text('Account Type')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: DropdownButtonFormField(
                                value: selectedType,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedType = newValue;
                                  });
                                },
                                items: [
                                  DropdownMenuItem<String>(
                                    value: 'Individual',
                                    child: Text('Individual',
                                        style: TextStyle(fontSize: 8.sp)),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Company',
                                    child: Text('Company',
                                        style: TextStyle(fontSize: 8.sp)),
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
                          SizedBox(width: 150, child: Text('Govt ID')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: DropdownButtonFormField(
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
                                    value: 'National ID',
                                    child: Text(
                                      'National ID',
                                      style: TextStyle(fontSize: 8.sp),
                                    ),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Iqama No.',
                                    child: Text(
                                      'Iqama No.',
                                      style: TextStyle(fontSize: 8.sp),
                                    ),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Visit Visa / Border No',
                                    child: Text(
                                      'Visit Visa / Border No',
                                      style: TextStyle(fontSize: 5.sp),
                                    ),
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
                          SizedBox(width: 150, child: Text('ID Number')),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: addressController,
                                validator: nameValidator,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 13),
                                  hintText: 'ID Number',
                                  contentPadding: EdgeInsets.all(5.0),
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
                                'Create Account',
                                style: TextStyle(
                                  fontFamily: 'Colfax',
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 7),
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
                                    Color.fromARGB(112, 112, 112, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      5), // Adjust border radius as needed
                                ),
                              ),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontFamily: 'Colfax',
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account? '),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return LoginPage();
                                },
                              );
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
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
