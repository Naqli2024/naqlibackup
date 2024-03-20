import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Widgets/customButton.dart';
import 'package:flutter_application_1/createAccount.dart';
import 'package:flutter_application_1/Widgets/formText.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';
import 'DialogBox/SingleTimeUser/mblNoDialog.dart';
import 'homePage.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  const LoginPage();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVerified = false;
  final ScrollController _Scroll1 = ScrollController();
  final ScrollController _Scroll2 = ScrollController();
  TextEditingController otpController = TextEditingController();

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
              child: Scrollbar(
                controller: _Scroll1,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: _Scroll1,
                  scrollDirection: Axis.vertical,
                  child: Container(
                    height: 780,
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
                                width: 500,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 500,
                            padding: EdgeInsets.only(
                              left: 4.w,
                              right: 4.w,
                              top: 15.h,
                              bottom: 15.h,
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
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text('Login',
                                      style: TabelText.helveticablack19),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Text('Email ID', style: TabelText.helvetica),
                                SizedBox(
                                  height: 6,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5.0),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text('Password', style: TabelText.helvetica),
                                SizedBox(
                                  height: 6,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5.0),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 43,
                                      width: 140,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                            barrierColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return MyHomePage();
                                            },
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromRGBO(128, 123, 229, 1),
                                          side: BorderSide(
                                            color: Color.fromRGBO(
                                                128, 123, 229, 1),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Text('Login',
                                            style: FormTextStyle.buttonText),
                                      ),
                                    ),
                                    InkWell(
                                      child: Text('Forgot Password?',
                                          style: FormTextStyle.purplehelvetica),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Don't have an account?",
                                        style: TabelText.helvetica),
                                    InkWell(
                                      child: Text(' Create One!',
                                          style: FormTextStyle.purplehelvetica),
                                      onTap: () {
                                        showDialog(
                                          barrierColor:
                                              Colors.grey.withOpacity(0.5),
                                          context: context,
                                          builder: (context) {
                                            return CreateAccount();
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  child: Text('Use without Log in',
                                      style: FormTextStyle.purplehelvetica),
                                  onTap: () async {
                                    // _showOtpVerificationDialog();

                                    showDialog(
                                      barrierColor:
                                          Colors.grey.withOpacity(0.5),
                                      context: context,
                                      builder: (context) {
                                        return MblNoDialog();
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
            padding: EdgeInsets.fromLTRB(2.w, 6.h, 2.w, 6.h),
            child: Dialog(
              child: Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(5.w, 15.h, 5.w, 15.h),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(31),
                    ),
                  ),
                  child: Scrollbar(
                    controller: _Scroll1,
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      controller: _Scroll1,
                      scrollDirection: Axis.horizontal,
                      child: Scrollbar(
                        controller: _Scroll2,
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                          controller: _Scroll2,
                          scrollDirection: Axis.vertical,
                          child: Container(
                            width: 500,
                            height: 420,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Login',
                                  style: TextStyle(
                                    fontFamily: 'Colfax',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Email ID',
                                        style: TabelText.helvetica)),
                                SizedBox(
                                  height: 6,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5.0),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Password',
                                        style: TabelText.helvetica)),
                                SizedBox(
                                  height: 6,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5.0),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 43,
                                  width: 140,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        barrierColor:
                                            Colors.grey.withOpacity(0.5),
                                        context: context,
                                        builder: (context) {
                                          return MyHomePage();
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromRGBO(128, 123, 229, 1),
                                      side: BorderSide(
                                        color: Color.fromRGBO(128, 123, 229, 1),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Text('Login',
                                        style: FormTextStyle.buttonText),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  child: Text('Forgot Password?',
                                      style: FormTextStyle.purplehelvetica),
                                  onTap: () {},
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don't have an account?",
                                        style: TabelText.helvetica),
                                    InkWell(
                                      child: Text('Create One!',
                                          style: FormTextStyle.purplehelvetica),
                                      onTap: () {
                                        showDialog(
                                          barrierColor:
                                              Colors.grey.withOpacity(0.5),
                                          context: context,
                                          builder: (context) {
                                            return CreateAccount();
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  child: Text('Use without Log in',
                                      style: FormTextStyle.purplehelvetica),
                                  onTap: () async {
                                    showDialog(
                                      barrierColor:
                                          Colors.grey.withOpacity(0.5),
                                      context: context,
                                      builder: (context) {
                                        return MblNoDialog();
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
                              ],
                            ),
                          ),
                        ),
                      ),
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
