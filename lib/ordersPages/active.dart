import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ActivePage extends StatelessWidget {
  const ActivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: Colors.amber,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 20.h,
              width: 300.w,
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      height: 15.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        color: Colors.lightGreenAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlBzi3zvaWrxiKbQYRJJOJCr1-hzaOMZLT8A&usqp=CAU',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 20,
                      left: 90,
                      child: Text(
                        'Jean Jacket',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
