import 'package:fashion_world/pages/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Last updated: 11/05/2024',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'This Privacy Policy explains how [ABC co. pvt Lmt] ("we", "us", or "our") collects, uses, and protects information collected from users ("User" or "You") of the [Your E-commerce Platform] website and mobile application ("Service"). By using the Service, you agree to the collection and use of information in accordance with this policy.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20.0),
            Text(
              'Information We Collect',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '- Personal Information: We may collect personal information such as your name, email address, phone number, billing and shipping address, payment details (including credit card information), and account credentials when you register, make a purchase, or subscribe to our newsletter.',
              textAlign: TextAlign.justify,
            ),
            Text(
              '- Order Information: We collect information related to your orders, including the products you purchase, order history, and transaction details.',
              textAlign: TextAlign.justify,
            ),
            Text(
              '- Device Information: We may collect information about your device, including device type, operating system, unique device identifiers, and IP address.',
              textAlign: TextAlign.justify,
            ),
            Text(
              '- Usage Data: We may collect information on how the Service is accessed and used ("Usage Data"). This Usage Data may include information such as your device\'s Internet Protocol address (e.g., IP)'
            ),
SizedBox(height: 20,),
Center(
child: InkWell(
  onTap: (){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
  },
  child: Container(
    height: 6.h,
    width: 30.w,
decoration: BoxDecoration(
  color: Colors.blue,
  borderRadius: BorderRadius.circular(20),
),
    child: Center(child: Text('Yes, Done !', style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500
    ),)),
  ),
),
)
            ])
            ));
            }}
