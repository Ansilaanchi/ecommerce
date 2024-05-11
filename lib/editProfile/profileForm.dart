// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileForm extends StatelessWidget {
  final String? Function(String?)? validator;
  final String name;
  final IconData? icon;
  bool obscureText = false;
  final VoidCallback onPressed;
  final TextEditingController controller;
  final String? hintText;
  ProfileForm({
    required this.obscureText,
    this.icon,
    required this.name,
    super.key,
    required this.controller,
    this.validator,
    required Null Function(dynamic value) onSaved,
    required this.onPressed,
    required this.hintText,
    // required this.obscureText
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: 1.h,
            top: 1.h,
            left: 1.w,
          ),
          child: Text(
            name,
            style: TextStyle(
                fontSize: 10.sp,
                // fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
      
        SizedBox(
          width: 90.w,
          // height: 8.h,
          child: TextFormField(
            validator: validator,
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.blueGrey),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.grey)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(14)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.grey)),
              fillColor: Colors.white,
              filled: true,
            
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        )
      ],
    );
  }
}