import 'dart:convert';
import 'dart:developer';

import 'package:fashion_world/bannerPage/bannerModel.dart';
import 'package:fashion_world/ip.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BannerGetData extends ChangeNotifier {
  BannerModel? _banData;
  bool _isLoading = false;

  BannerModel? get bannerData => _banData;
  bool get isLoading => _isLoading;

  Future<void> fetchBannerData() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('token');
      log('Token: $token');

      final response = await http.get(
        Uri.parse('http://$ip:3000/flutter/banner'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      log('Response Status Code: ${response.statusCode}');
      log('ansiiiiiiiiiiiiiiiiiiiiiiiiii');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        log('Response Body: $jsonData');

        _banData = BannerModel.fromJson(jsonData);
        notifyListeners();
      } else {
        throw Exception('Failed to load banner data: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching banner data: $e');
      throw Exception('Error fetching banner data: $e');
    }
  }
}
