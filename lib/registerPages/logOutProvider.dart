// ignore_for_file: file_names, use_build_context_synchronously, unused_import
import 'dart:developer';
import 'package:fashion_world/registerPages/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOutProvider extends ChangeNotifier {
  Future<void> logout(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove('token');
    await pref.remove('userlogin');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>LoginPage()),
    );
  }
}
