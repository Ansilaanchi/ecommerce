import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import '../registerPages/login.dart';

class VarificationScreen extends StatefulWidget {
  const VarificationScreen({super.key});

  @override
  State<VarificationScreen> createState() => _VarificationScreenState();
}

class _VarificationScreenState extends State<VarificationScreen> {
  final TextEditingController otpController = TextEditingController();

  Future<void> verifyOTP(BuildContext context, String otp) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userid = await prefs.get('userid');
      var response = await http.post(
        Uri.parse("http://192.168.29.154:3000/flutter/validate-otp"),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {
          'id': userid,
          'otp': otp, // No need to convert otp to string
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(response.body);

        // If the OTP is correct, navigate to the login page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        // Display error message if user id is not received
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('User ID Error'),
              content: Text('Failed to retrieve user ID from the server.'),
            );
          },
        );
      }
    } catch (e) {
      // Display error message for exceptions
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred: $e'),
          );
        },
      );
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.sizeOf(context).height;
    // double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.5.h, left: 3.w),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    print('back button');
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Center(
              child: Text(
                'Verify Code',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            'Please enter the code we just sent to email',
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 136, 135, 135),
            ),
          ),
          Text(
            'example@email.com',
            style: TextStyle(
              color: Colors.red,
              fontSize: 11.1.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 6.h),

          //pinput package we will use here
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              // width: width,
              child: Pinput(
                controller: otpController,
                length: 6,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                pinAnimationType: PinAnimationType.slide,
                defaultPinTheme: PinTheme(
                    height: 50.0,
                    width: 50.0,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 25,
                    ),
                    decoration: BoxDecoration(
                        // shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.5),
                          width: 1.8,
                        ))),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'Resend code',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  fontSize: 11.sp,
                  color: Colors.black,
                ),
              )),

          SizedBox(height: 8.h),
          GestureDetector(
            onTap: () {
              verifyOTP(context, otpController.text);
            },
            child: Container(
              height: 60,
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Verify',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
