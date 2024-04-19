import 'package:flutter/material.dart';

class RowCategory extends StatefulWidget {
  const RowCategory({Key? key}) : super(key: key);

  @override
  State<RowCategory> createState() => _RowCategoryState();
}

class _RowCategoryState extends State<RowCategory> {
  final ScrollController _scrollController =
      ScrollController(); // Controller for ListView

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller:
            _scrollController, // Attaching the ScrollController to ListView
        scrollDirection: Axis.horizontal,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  _scrollController.animateTo(0.0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                child: Text('All'),
              ),
              InkWell(
                onTap: () {
                  _scrollController.animateTo(100.0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                child: Text('Men'),
              ),
              InkWell(
                onTap: () {
                  _scrollController.animateTo(200.0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                child: Text('Women'),
              ),
              InkWell(
                onTap: () {
                  _scrollController.animateTo(300.0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                child: Text('Kids'),
              ),
            ],
          )
        ],
      ),
    );
  }

  // // @override
  // // void dispose() {
  // //   _scrollController.dispose(); // Dispose the scroll controller when not needed
  // //   super.dispose();
  // }
}
