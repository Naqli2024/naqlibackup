import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/DialogBox/SingleTimeUser/verfiedDialog.dart';
import 'package:flutter_application_1/Users/SingleTimeUser/availableUnits.dart';
import 'package:flutter_application_1/Widgets/customButton.dart';
import 'package:flutter_application_1/Widgets/formText.dart';
import 'package:flutter_application_1/DialogBox/bookingSuccessful.dart';
import 'package:sizer/sizer.dart';

import '../../createAccount.dart';
import '../../homePage.dart';

class OTPDialog extends StatefulWidget {
  const OTPDialog();

  @override
  _OTPDialogState createState() => _OTPDialogState();
}

class _OTPDialogState extends State<OTPDialog> {
  bool isVerified = false;
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
          showErrorDialog(
              "Invalid phone number format. Please enter a valid 10-digit phone number.");
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
                            builder: (context) => MyHomePage(),
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

  TextEditingController contactNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 1180) {
          return Padding(
            padding: EdgeInsets.fromLTRB(15.w, 6.h, 15.w, 6.h),
            child: Dialog(
              child: SingleChildScrollView(
                child: Expanded(
                  child: Container(
                    height: 360,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(31),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(4.w, 4.h, 4.w, 4.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                barrierColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return VerifiedDialog();
                                },
                              );
                              // _startPhoneAuth(contactNumberController.text);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(60, 55, 148, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
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
            child: Dialog(
              child: SingleChildScrollView(
                child: Expanded(
                  child: Container(
                    width: 350,
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
                        Text(
                          'Enter Mobile NO',
                          style: TextStyle(
                            fontFamily: 'Colfax',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 30,
                          width: 200,
                          child: TextField(
                            controller: contactNumberController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
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
                                  return VerifiedDialog();
                                },
                              );
                              // _startPhoneAuth(contactNumberController.text);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(60, 55, 148, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                )),
                            child: Text(
                              "Get OTP",
                              style: TextStyle(
                                fontFamily: 'Colfax',
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: EdgeInsets.only(left: 2.w, right: 2.w),
                          child: Divider(),
                        ),
                        SizedBox(height: 10),
                        Text("Didn't receive an email? ",
                            style: TabelText.helvetica),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            // Implement the logic to resend the OTP
                            // For now, let's close the dialog
                            Navigator.pop(context);
                          },
                          child: Text("Resend.",
                              style: FormTextStyle.purplehelvetica),
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
