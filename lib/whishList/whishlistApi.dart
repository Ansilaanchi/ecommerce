
import 'dart:convert';
import 'dart:developer';
import 'package:fashion_world/cartPages/cartGet.dart';
import 'package:fashion_world/ip.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WhishlistApi extends ChangeNotifier {
  Product? bbdd;
    bool _isLoading = false;

  bool get isLoading => _isLoading;


  Future<void> whishData() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('token');
      log('Token: $token');

      final response = await http.get(
        Uri.parse('http://$ip:3000/flutter/wishlist'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData != null && jsonData is Map<String, dynamic>) {
          bbdd=Product.fromJson(jsonData);
          notifyListeners(); // Notify listeners of the changes
          log('whishList: $bbdd');
        }
      } else {
        log("Failed...whishList: ${response.statusCode}");
      }
    } catch (e) {
      log("Error: $e");
    }
  }
}
