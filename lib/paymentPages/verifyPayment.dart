import 'package:fashion_world/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class VerifyPayment extends StatelessWidget {
  const VerifyPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: CircleAvatar(
                radius: 67.sp,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.verified_rounded,
                  color: Colors.white,
                  size: 100.sp,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Payment Successful!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  color: Colors.black),
            ),
            SizedBox(
              height: 0.4.h,
            ),
            Text(
              "Thank you for your purchase.",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10.sp,
                  color: Colors.black),
            ),
            SizedBox(
              height: 7.h,
            ),
            SizedBox(
              width: 39.w,
              height: 7.h,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }));
                  },
                  child: Center(
                    child: Text(
                      "Continue to shopping",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}