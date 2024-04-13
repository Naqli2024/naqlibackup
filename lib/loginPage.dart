import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Users/Enterprise/dashboard_page.dart';
import 'package:flutter_application_1/Users/SingleUser/dashboard_page.dart';
import 'package:flutter_application_1/Users/SingleUser/homePageSingleUser.dart';
import 'package:flutter_application_1/Users/SuperUser/dashboard_page.dart';
import 'package:flutter_application_1/availableEquipment.dart';
import 'package:flutter_application_1/availableVehicle.dart';
import 'package:flutter_application_1/createAccount.dart';
import 'package:flutter_application_1/Widgets/formText.dart';
import 'package:sizer/sizer.dart';

import 'Controllers/allUsersFormController.dart';
import 'DialogBox/SingleTimeUser/mblNoDialog.dart';
import 'DialogBox/SingleTimeUser/verfiedDialog.dart';
import 'Widgets/customTextField.dart';
import 'homePage.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  const LoginPage();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isVerified = false;
  final ScrollController _Scroll1 = ScrollController();
  final ScrollController _Scroll2 = ScrollController();
  TextEditingController otpController = TextEditingController();
  AllUsersFormController controller = AllUsersFormController();
  TextEditingController contactNumberController = TextEditingController();

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '*Required';
    } else if (!isValidEmail(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  Future<String> getUserRole(String uid) async {
    try {
      String enterpriseCollection = 'enterpriseuser';
      String superuserCollection = 'superuser';
      String userCollection = 'user';

      // Check if the user is an admin
      DocumentSnapshot<Map<String, dynamic>> enterpriseSnapshot =
          await FirebaseFirestore.instance
              .collection(enterpriseCollection)
              .doc(uid)
              .get();

      if (enterpriseSnapshot.exists) {
        print('Login as admin');
        return 'Enterprise';
      }

      // Check if the user is a regular user
      DocumentSnapshot<Map<String, dynamic>> userSnapshot =
          await FirebaseFirestore.instance
              .collection(userCollection)
              .doc(uid)
              .get();

      if (userSnapshot.exists) {
        print('Login as user');
        return 'User';
      }

      // Check if the user is a superuser
      DocumentSnapshot<Map<String, dynamic>> superuserSnapshot =
          await FirebaseFirestore.instance
              .collection(superuserCollection)
              .doc(uid)
              .get();

      if (superuserSnapshot.exists) {
        print('Login as superuser');
        return 'Superuser';
      }
    } catch (e) {
      print('Error determining user role: $e');
    }

    return 'Unknown';
  }

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
            child: Scrollbar(
              controller: _Scroll1,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: _Scroll1,
                scrollDirection: Axis.vertical,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(31))),
                  child: Container(
                    height: 770,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 128, 123, 229),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(31),
                                bottomLeft: Radius.circular(31),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset(
                                'loginlogo.png',
                                width: 600,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 770,
                            padding: EdgeInsets.only(
                              left: 4.w,
                              right: 4.w,
                              top: 5.h,
                              bottom: 5.h,
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(31),
                                bottomRight: Radius.circular(31),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: SizedBox(
                                      height: 0.1,
                                    )),
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
                                SizedBox(
                                  height: 100,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text('Login',
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontFamily: 'Helvetica',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 26,
                                          letterSpacing: 2)),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('Email ID',
                                    style: HomepageText.helvetica16black),
                                CustomTextfield(
                                  controller: controller.email,
                                  validator: emailValidator,
                                  text: 'Email address',
                                ),
                                Text('Password',
                                    style: HomepageText.helvetica16black),
                                CustomTextfield(
                                  controller: controller.password,
                                  // validator: validatePassword,
                                  text: 'Password',
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            try {
                                              // Sign in with email and password
                                              UserCredential userCredential =
                                                  await _auth
                                                      .signInWithEmailAndPassword(
                                                email: controller.email.text,
                                                password:
                                                    controller.password.text,
                                              );
                                              String userId =
                                                  userCredential.user!.uid;
                                              // Check the user's role after successful sign-in
                                              String userRole =
                                                  await getUserRole(userId);

                                              print('User Role = $userRole');
                                              // Navigate to the appropriate dashboard based on the user's role
                                              if (userRole == 'User') {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MyHomePagesingle(
                                                            user: userId,
                                                          )),
                                                );
                                              } else if (userRole ==
                                                  'Superuser') {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        SuperUserDashboardPage(
                                                            user: userId),
                                                  ),
                                                );
                                              } else if (userRole ==
                                                  'Enterprise') {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        EnterDashboardPage(
                                                            user: userId),
                                                  ),
                                                );
                                              } else {
                                                print('Unknown user role');
                                              }
                                            } on FirebaseAuthException catch (e) {
                                              // Handle authentication exceptions
                                              if (e.code == 'user-not-found') {
                                                print(
                                                    'No user found for that email.');
                                              } else if (e.code ==
                                                  'wrong-password') {
                                                print(
                                                    'Wrong password provided.');
                                              }
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromARGB(
                                                255, 128, 123, 229),
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                color: const Color.fromRGBO(
                                                        112, 112, 112, 1)
                                                    .withOpacity(0.3),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                1.w, 4, 1.w, 4),
                                            child: Text(
                                              'Login',
                                              style: TextStyle(
                                                fontFamily: 'Helvetica',
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        )),
                                    InkWell(
                                      child: Text('Forgot Password?',
                                          style: LoginpageText.purplehelvetica),
                                      onTap: () {
                                        showDialog(
                                          barrierColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return ForgotPasswordPage();
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Don't have an account?",
                                        style: HomepageText.helvetica16black),
                                    InkWell(
                                      child: Text(' Create One!',
                                          style: LoginpageText.purplehelvetica),
                                      onTap: () {
                                        showDialog(
                                          barrierColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return CreateAccount();
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                InkWell(
                                  child: Text('Use without Log in',
                                      style: LoginpageText.purplehelvetica),
                                  onTap: () async {
                                    showDialog(
                                      barrierColor:
                                          Colors.grey.withOpacity(0.5),
                                      context: context,
                                      builder: (context) {
                                        return MblNoDialog();
                                      },
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                              ],
                            ),
                          ),
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
            padding: EdgeInsets.only(
              left: 18.w,
              right: 18.w,
              top: 8.h,
              bottom: 8.h,
            ),
            child: Scrollbar(
              controller: _Scroll1,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: _Scroll1,
                scrollDirection: Axis.vertical,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(31))),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 4.w,
                      right: 4.w,
                      top: 5.h,
                      bottom: 5.h,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(31),
                      ),
                    ),
                    height: 770,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: SizedBox(
                              height: 0.1,
                            )),
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
                        SizedBox(
                          height: 100,
                        ),
                        Text('Login',
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                letterSpacing: 2)),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Email ID',
                                style: HomepageText.helvetica16black)),
                        CustomTextfield(
                          controller: controller.email,
                          validator: emailValidator,
                          text: 'Email address',
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Password',
                                style: HomepageText.helvetica16black)),
                        CustomTextfield(
                          controller: controller.password,
                          // validator: validatePassword,
                          text: 'Password',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                print('email ${controller.email.text}');
                                // Sign in with email and password
                                UserCredential userCredential =
                                    await _auth.signInWithEmailAndPassword(
                                  email: controller.email.text,
                                  password: controller.password.text,
                                );
                                print('email---- ${controller.email.text}');
                                // Check the user's role after successful sign-in
                                String userId = userCredential.user!.uid;
                                String userRole = await getUserRole(userId);

                                // Navigate to the appropriate dashboard based on the user's role
                                if (userRole == 'User') {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SingleUserDashboardPage(
                                              user: userId!),
                                    ),
                                  );
                                } else if (userRole == 'Super User') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SuperUserDashboardPage(
                                                user: userId),
                                      ));
                                } else if (userRole == 'Enterprise') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EnterDashboardPage(user: userId),
                                      ));
                                } else {
                                  print('Unknown user role');
                                }
                              } on FirebaseAuthException catch (e) {
                                // Handle authentication exceptions
                                if (e.code == 'user-not-found') {
                                  print('No user found for that email.');
                                } else if (e.code == 'wrong-password') {
                                  print('Wrong password provided.');
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 128, 123, 229),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color:
                                        const Color.fromRGBO(112, 112, 112, 1)
                                            .withOpacity(0.3)),
                                borderRadius: BorderRadius.circular(
                                    10), // Adjust border radius as needed
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(1.w, 4, 1.w, 4),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        InkWell(
                          child: Text('Forgot Password?',
                              style: LoginpageText.purplehelvetica),
                          onTap: () {
                            showDialog(
                              barrierColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return ForgotPasswordPage();
                              },
                            );
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?",
                                style: HomepageText.helvetica16black),
                            InkWell(
                              child: Text(' Create One!',
                                  style: LoginpageText.purplehelvetica),
                              onTap: () {
                                showDialog(
                                  barrierColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return CreateAccount();
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        InkWell(
                          child: Text('Use without Log in',
                              style: LoginpageText.purplehelvetica),
                          onTap: () async {
                            // _showOtpVerificationDialog();
                            String email = controller.email.text;
                            String password = controller.password.text;
                            String selectedAccounttype =
                                controller.selectedAccounttype.text;
                            showDialog(
                              barrierColor: Colors.grey.withOpacity(0.5),
                              context: context,
                              builder: (context) {
                                return VerifiedDialog(
                                    email, password, selectedAccounttype);
                              },
                            );
                            if (isVerified) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyHomePage(),
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: 60,
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

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  Future<void> _resetPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.fromLTRB(4.w, 5.h, 3.w, 10.h),
              height: 340,
              width: 1225,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(31),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
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
                  Text('Password Reset link has been sent to your email.',
                      style: TabelText.helveticablack19),
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(60, 55, 148, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          )),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 1.w,
                          right: 1.w,
                        ),
                        child: Text("OK", style: DialogText.helvetica20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(e.toString()),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.w, 27.h, 18.w, 27.h),
      child: SingleChildScrollView(
        child: Expanded(
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(31))),
            child: Container(
              height: 360,
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
                          child: Text('Reset Password',
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
                  Text('Enter your email to reset Password',
                      style: DialogText.helvetica25black),
                  SizedBox(
                    height: 45,
                    width: 400,
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () => _resetPassword(context),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(60, 55, 148, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          )),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 1.w,
                          right: 1.w,
                        ),
                        child: Text('Send', style: DialogText.helvetica20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2.w, right: 5.w),
                    child: Divider(
                      color: Color.fromRGBO(112, 112, 112, 1),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Didn't receive OTP ?",
                          style: HomepageText.helvetica16black),
                      InkWell(
                        child: Text(' Resend',
                            style: DialogText.purplehelveticabold),
                        onTap: () async {
                          await FirebaseAuth.instance.sendPasswordResetEmail(
                              email: _emailController.text);
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
  }
}
