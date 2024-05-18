// ignore_for_file: file_names, avoid_print
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  const ProfileButton({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 92.w,
      height: 6.5.h,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)))),
          onPressed: onPressed,
          child: Text(
            name,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
