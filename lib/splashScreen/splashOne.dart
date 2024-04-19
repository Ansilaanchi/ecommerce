import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  // image: AssetImage('assets/fashionable-model-stylish-hat-red-260nw-2035039067.webp'),
                  image:
                      AssetImage("assets/Model-Studio-Photo-Shoot-800x534.jpg"),
                  fit: BoxFit.cover)),
        ),
      ]),
    );
  }
}
