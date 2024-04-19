import 'package:flutter/material.dart';

class RowTab extends StatelessWidget {
  final String text;
  RowTab({super.key, required this.text, required TextStyle style});

  @override
  Widget build(BuildContext context) {
    return Tab(
      text: text,
    );
  }
}
