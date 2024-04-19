import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'splashscreen.dart'; // Import SplashScreen

class SplashLast extends StatefulWidget {
  const SplashLast({Key? key}) : super(key: key);

  @override
  _SplashLastState createState() => _SplashLastState();
}

class _SplashLastState extends State<SplashLast> {
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.amber[400],
            image: const DecorationImage(
                image: AssetImage('assets/DSC2465_awards_A.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: SwipeableButtonView(
            buttonText: 'SLIDE HERE..!',
            buttontextstyle: const TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            buttonWidget: SizedBox(
              height: 60,
              width: double.infinity,
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            activeColor: Color.fromARGB(255, 2, 36, 16),
            isFinished: isFinished,
            onWaitingProcess: () {
              Future.delayed(Duration(seconds: 2), () {
                setState(() {
                  isFinished = true; // Update isFinished using setState
                });
              });
            },
            onFinish: () {
              // Handle navigation after isFinished is updated
              if (isFinished) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SplashScreen()),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
