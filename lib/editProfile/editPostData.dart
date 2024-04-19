// In ProfileDataPost class
// ignore_for_file: unnecessary_brace_in_string_interps, await_only_futures, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:fashion_world/ip.dart';
import 'package:fashion_world/model/prof_get/prof_get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

// In ProfileDataPost class
Future<ProfileData> ProfilepostDat(
    String name, String phoneno, File image) async {
  try {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = await pref.getString('token');

    final response = await http.post(
      Uri.parse('http://${ip}:3000/flutter/edituser'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'name': name, 'phoneno': phoneno, 'image': image}),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return ProfileData.fromJson(jsonData);
    } else {
      throw Exception('Failed to update profile');
    }
  } catch (e) {
    throw Exception('Failed to update profile');
  }
}
