import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EmotionFaces extends StatelessWidget {
  final emotionface;
  const EmotionFaces({super.key, required this.emotionface});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: 12.w,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 168, 176, 180),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Text(
          emotionface,
          //  style: TextStyle(fontSize: 16),
        )),
      ),
    );
  }
}
