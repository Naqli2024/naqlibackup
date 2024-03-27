import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Controllers/allUsersFormController.dart';
import 'package:flutter_application_1/DialogBox/SingleTimeUser/optDialog.dart';
import 'package:flutter_application_1/DialogBox/SingleTimeUser/verfiedDialog.dart';
import 'package:flutter_application_1/Widgets/formText.dart';
import 'package:sizer/sizer.dart';

import '../../Users/Enterprise/dashboard_page.dart';
import '../../Users/SingleUser/dashboard_page.dart';
import '../../Users/SuperUser/dashboard_page.dart';
import '../../createAccount.dart';
import '../../homePage.dart';

class MblNoDialog extends StatefulWidget {
  String email;
  String password;
  String selectedAccounttype;
  String firstName;
  String lastName;
  String legalName;
  String contactNumber;
  String address;
  String selectedGovtId;
  String confirmPassword;
  String alternateNumber;
  String address2;
  String idNumber;
  String selectedCity;
  String companyidNumber;

  MblNoDialog(
      this.email,
      this.password,
      this.selectedAccounttype,
      this.firstName,
      this.lastName,
      this.legalName,
      this.address,
      this.address2,
      this.alternateNumber,
      this.companyidNumber,
      this.confirmPassword,
      this.contactNumber,
      this.idNumber,
      this.selectedCity,
      this.selectedGovtId);

  @override
  _MblNoDialogState createState() => _MblNoDialogState();
}

class _MblNoDialogState extends State<MblNoDialog> {
  bool isVerified = false;
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController otp5 = TextEditingController();
  TextEditingController otp6 = TextEditingController();
  AllUsersFormController controller = AllUsersFormController();
  TextEditingController otpController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
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

  bool isValidPhoneNumber(String phoneNumber) {
    // Regular expression pattern to match a 10-digit phone number
    RegExp regex = RegExp(r'^[0-9]{10}$');

    // Check if the phone number matches the pattern
    if (regex.hasMatch(phoneNumber)) {
      // Phone number format is valid
      return true;
    } else {
      // Phone number format is invalid
      return false;
    }
  }

  String?
      storedVerificationId; // Declare a variable to store the verification ID

  Future<void> _startPhoneAuth(String phoneNumber) async {
    print("mobtrack3");

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
          showErrorDialog(
              "Invalid phone number format. Please enter a valid 10-digit phone number.");
        },
        codeSent: (String verificationId, [int? forceResendingToken]) {
          // Store the verification ID for later use (e.g., resend OTP)
          storedVerificationId = verificationId;

          // Show the dialog to enter OTP

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                titlePadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.zero,
                content: Container(
                  height: 310,
                  width: 1215,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(31),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(4.w, 4.h, 4.w, 4.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Center(
                              child: Text('Verify',
                                  style: TabelText.helveticablack19),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: ImageIcon(
                              AssetImage('cancel.png'),
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20), // Adjust spacing as needed
                      Text(
                        'Your code was sent to your mobile no',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Helvetica',
                          fontSize: 22,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 45,
                            width: 45,
                            child: TextField(
                              controller: otp1,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 0.5.w,
                          ),
                          SizedBox(
                            height: 45,
                            width: 45,
                            child: TextField(
                              controller: otp2,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 0.5.w,
                          ),
                          SizedBox(
                            height: 45,
                            width: 45,
                            child: TextField(
                              controller: otp3,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 0.5.w,
                          ),
                          SizedBox(
                            height: 45,
                            width: 45,
                            child: TextField(
                              controller: otp4,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 0.5.w,
                          ),
                          SizedBox(
                            height: 45,
                            width: 45,
                            child: TextField(
                              controller: otp5,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 0.5.w,
                          ),
                          SizedBox(
                            height: 45,
                            width: 45,
                            child: TextField(
                              controller: otp6,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20), // Adjust spacing as needed
                      SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () async {
                            String email = controller.email.text;
                            String password = controller.password.text;
                            String selectedAccounttype =
                                widget.selectedAccounttype;
                            String smsCode = otp1.text +
                                otp2.text +
                                otp3.text +
                                otp4.text +
                                otp5.text +
                                otp6.text; // Concatenate all OTP fields
                            PhoneAuthCredential _credential =
                                PhoneAuthProvider.credential(
                              verificationId: storedVerificationId!,
                              smsCode: smsCode,
                            );

                            FirebaseAuth.instance
                                .signInWithCredential(_credential)
                                .then((result) {
                              if (result.user != null) {
                                print("OTP verified successfully");

                                // Fetch user details from Firebase
                                // Fetch user details from Firebase
                                User? user = FirebaseAuth.instance.currentUser;
                                String? phoneNumber = user?.phoneNumber;

                                // Check if any document exists in 'users' collection
                                FirebaseFirestore.instance
                                    .collection('users')
                                    .get()
                                    .then((QuerySnapshot querySnapshot) {
                                  if (querySnapshot.docs.isNotEmpty) {
                                    // At least one document exists, you can fetch and display data here
                                    // For simplicity, let's assume you want to display the first document's data
                                    QueryDocumentSnapshot firstDocument =
                                        querySnapshot.docs.first;
                                    Map<String, dynamic> userData =
                                        firstDocument.data() as Map<String,
                                            dynamic>; // Explicit cast

                                    // Check if 'firstName' field exists in the document
                                    if (userData.containsKey('firstName')) {
                                      String? firstName = userData['firstName'];
                                      String? lastName = userData['lastName'];
                                      // Display user details in a dialog box
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            child: Container(
                                              height: 340,
                                              width: 1225,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(31),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      ImageIcon(
                                                        AssetImage(
                                                          'approved.png',
                                                        ),
                                                        color: Color.fromRGBO(
                                                            60, 55, 148, 1),
                                                        size: 30,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text('Account Verified',
                                                          style: TabelText
                                                              .helveticablack19),
                                                      SizedBox(
                                                        width: 200,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () async {
                                                          UserCredential
                                                              userCredential =
                                                              await _auth
                                                                  .signInWithEmailAndPassword(
                                                            email: widget.email,
                                                            password:
                                                                widget.password,
                                                          );
                                                          if (widget
                                                                  .selectedAccounttype ==
                                                              'Enterprise') {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      EnterDashboardPage(
                                                                          user:
                                                                              userCredential.user!)),
                                                            );
                                                          } else if (widget
                                                                  .selectedAccounttype ==
                                                              'Super User') {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      SuperUserDashboardPage(
                                                                          user:
                                                                              userCredential.user!)),
                                                            );
                                                          } else if (widget
                                                                  .selectedAccounttype ==
                                                              'User') {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      SingleUserDashboardPage(
                                                                          user:
                                                                              userCredential.user!)),
                                                            );
                                                          } else {
                                                            // Handle invalid selectedType
                                                            print(
                                                                'Invalid selected type: ${widget.selectedAccounttype}');
                                                          }
                                                        },
                                                        child: ImageIcon(
                                                          AssetImage(
                                                              'cancel.png'),
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("Name: $firstName"),
                                                      Text("Name: $lastName"),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                      "Phone Number: $phoneNumber"),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      print(
                                          'No firstName field found in Firestore document.');
                                    }
                                  } else {
                                    // No documents found in 'users' collection
                                    print('No user data found in Firestore.');
                                  }
                                }).catchError((e) {
                                  print("Error fetching user data: $e");
                                });
                              } else {
                                showErrorDialog(
                                    "Invalid verification code. Please enter the correct code.");
                              }
                            }).catchError((e) {
                              print("Error signing in with credential: $e");
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(60, 55, 148, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text("Verify", style: TabelText.dialogtext1),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2.w, right: 2.w),
                        child: Divider(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Didn't receive OTP ?",
                              style: TabelText.helvetica),
                          InkWell(
                            child: Text('Resend',
                                style: FormTextStyle.purplehelvetica),
                            onTap: () async {
                              await _startPhoneAuth(
                                  contactNumberController.text);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle code auto retrieval timeout if needed
        },
        timeout: Duration(seconds: 45),
      );
    } catch (e) {
      print('Error during phone authentication: $e');
      showErrorDialog(
          "Error during phone number verification. Please try again.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 1180) {
          return Padding(
            padding: EdgeInsets.fromLTRB(18.w, 33.h, 18.w, 33.h),
            child: SingleChildScrollView(
              child: Expanded(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(31))),
                  child: Container(
                    height: 280,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(31),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(4.w, 4.h, 2.w, 4.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Center(
                                child: Text('Enter Mobile No',
                                    style: LoginpageText.helvetica30bold),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: ImageIcon(
                                AssetImage('cancel.png'),
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                              width: 200,
                              child: TextField(
                                controller: contactNumberController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: '99999 99999',
                                  contentPadding: EdgeInsets.only(
                                    left: 1.w,
                                  ),
                                  hintStyle: DialogText.helvetica16sandal,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () async {
                                  await _startPhoneAuth(
                                      contactNumberController.text);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromRGBO(60, 55, 148, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    )),
                                child: Text("Get OTP",
                                    style: LoginpageText.helvetica16white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: EdgeInsets.only(left: 2.w, right: 5.w),
                          child: Divider(
                            color: Color.fromRGBO(112, 112, 112, 1),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?",
                                style: HomepageText.helvetica16black),
                            InkWell(
                              child: Text('Create One!',
                                  style: LoginpageText.purplehelvetica),
                              onTap: () {
                                showDialog(
                                  barrierColor: Colors.grey.withOpacity(0.5),
                                  context: context,
                                  builder: (context) {
                                    return CreateAccount();
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.fromLTRB(2.w, 6.h, 2.w, 6.h),
            child: SingleChildScrollView(
              child: Expanded(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(31))),
                  child: Container(
                    width: 400,
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(31),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(1.5.w, 4.h, 1.5.w, 4.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Center(
                                child: Text('Enter Mobile No',
                                    style: LoginpageText.helvetica30bold),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: ImageIcon(
                                AssetImage('cancel.png'),
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 30,
                          width: 200,
                          child: TextField(
                            controller: contactNumberController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: '99999 99999',
                              contentPadding: EdgeInsets.only(
                                left: 1.w,
                              ),
                              hintStyle: DialogText.helvetica16sandal,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0)),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                barrierColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return OTPDialog(
                                      verificationId: storedVerificationId);
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(60, 55, 148, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                )),
                            child: Text("Get OTP",
                                style: LoginpageText.helvetica16white),
                          ),
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: EdgeInsets.only(left: 2.w, right: 2.w),
                          child: Divider(),
                        ),
                        SizedBox(height: 10),
                        Text("Don't have an account?",
                            style: HomepageText.helvetica16black),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            showDialog(
                              barrierColor: Colors.grey.withOpacity(0.5),
                              context: context,
                              builder: (context) {
                                return CreateAccount();
                              },
                            );
                          },
                          child: Text('Create One!',
                              style: LoginpageText.purplehelvetica),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      });
    });
  }
}
