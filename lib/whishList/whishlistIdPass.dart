import 'dart:developer';

import 'package:fashion_world/ip.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WhishlistIdPass extends ChangeNotifier {
  void fetchWishpass(String idData) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('token');
      log('Token: $token');
      log('kkkkkkkkkkkkkkkkkkkkk');

      String uri = 'http://$ip:3000/flutter/wishlist/$idData';

      final response = await http.get(Uri.parse(uri), headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      });

      if (response.statusCode == 200) {
        log("${response.statusCode}");
        log("${response.body}");
        log("...whishlist.....id Get............");
        log('$idData');
      }
    } catch (e) {
      // Handle errors here
      log('Error fetching data: $e');
    }
  }

  void addAndRemove(BuildContext context, dynamic idData) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('token');

      final response = await http.get(
        Uri.parse('http://$ip:3000/flutter/wishlist/$idData'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        // Notify listeners after adding item to cart
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text('whishList add..........'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('failed whishlist'),
          ),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Error adding product to whishlist'),
        ),
      );
    }
  }
}
