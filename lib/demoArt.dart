import 'package:flutter/material.dart';

class DemoArt extends StatelessWidget {
  const DemoArt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Colors.lightBlue,
        title: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
