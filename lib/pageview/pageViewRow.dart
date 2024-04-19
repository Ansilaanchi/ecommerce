import 'package:flutter/material.dart';

class ItemsRow extends StatelessWidget {
  const ItemsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: PageController(), // Controller for PageView
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.amber,
            child: Center(
              child: Text('Women'),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.purpleAccent,
            child: Center(
              child: Text('Men'),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.pink,
            child: Center(
              child: Text('Kids'),
            ),
          ),
        ],
      ),
    );
  }
}
