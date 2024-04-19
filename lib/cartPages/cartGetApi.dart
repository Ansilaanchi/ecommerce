import 'dart:convert';
import 'dart:developer';
import 'package:fashion_world/cartPages/cartGet.dart';
import 'package:fashion_world/ip.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CartGetCart extends ChangeNotifier {
  CartGet? aabb;

  Future<void> fetchCart() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('token');
      log('Token: $token');

      final response = await http.get(
        Uri.parse('http://$ip:3000/flutter/cart'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData != null && jsonData is Map<String, dynamic>) {
          aabb = CartGet.fromJson(jsonData);
          notifyListeners(); // Notify listeners of the changes
          log('Cart data: $aabb');
        }
      } else {
        log("Failed to fetch cart: ${response.statusCode}");
      }
    } catch (e) {
      log("Error: $e");
    }
  }
}
