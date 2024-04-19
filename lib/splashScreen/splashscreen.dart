// splashScreen.dart
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'splashLast.dart'; // Correct import statement for SplashLast widget
import 'splashOne.dart'; // Assuming similar import statements for other splash screens
import 'splashTwo.dart';
import 'splashThree.dart';

class SplashScreen extends StatelessWidget {
  final _controller = PageController();

  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 800, // Fixed height for PageView
              child: PageView(
                controller: _controller,
                children: const [
                  Page1(),
                  Page2(),
                  Page3(),
                ],
              ),
            ),
            const SizedBox(height: 50),
            SmoothPageIndicator(
              controller: _controller,
              count: 3, // Update count to include SplashLast
              effect: JumpingDotEffect(
                activeDotColor: Colors.deepPurple,
                dotColor: Colors.deepPurple.shade100,
                dotHeight: 20,
                dotWidth: 20,
                spacing: 16,
                jumpScale: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
