// ignore_for_file: prefer_final_fields, unused_import

import 'dart:convert';
import 'dart:developer';
import 'package:fashion_world/cartPages/cartGet.dart';
import 'package:fashion_world/checkOut/checkout/checkout.dart';
import 'package:fashion_world/ip.dart';
import 'package:fashion_world/whishList/wish_listmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutApi extends ChangeNotifier {
  Checkout? checkout;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> checkData() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('token');
      log('Token: $token');

      final response = await http.get(
        Uri.parse('http://$ip:3000/flutter/checkout'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        log(response.body);
        log("ssssssssssssssseeeeeeeennnnnnnnnaaaaaaaaaaaaaaaaaaaa");
        final jsonData = json.decode(response.body);
        if (jsonData != null && jsonData is Map<String, dynamic>) {
          checkout = Checkout.fromJson(jsonData);
          notifyListeners(); // Notify listeners of the changes
          log('Checkout: $Checkout');
        }
      } else {
        log("Failed...checkout: ${response.statusCode}");
      }
    } catch (e) {
      log("Error: $e");
    }
  }
}
