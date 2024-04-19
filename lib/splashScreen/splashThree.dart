import 'package:fashion_world/registerPages/login.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.amber[400],
                  image: const DecorationImage(
                      image: AssetImage(
                          'assets/Types-of-Fashion-Photography-Thumbnail.webp'),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
              bottom: 20,
              left: 30,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Container(
                  height: 8.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 140, 175, 194),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Text(
                    'Get Started',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ))
        ],
      ),
    );
  }
}
