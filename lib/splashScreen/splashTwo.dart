import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.deepPurple[400],
              image: const DecorationImage(
                  image: AssetImage('assets/1600w-1h_Fj-14AQs.webp'),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
