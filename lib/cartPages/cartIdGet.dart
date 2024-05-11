import 'dart:developer';

import 'package:fashion_world/ip.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CartItemPass extends ChangeNotifier {
  void fetchData(String idData) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('token');
      log('Token: $token');
      log('bbbbbbbbbbbbbbbbbbbbbbbbbbb');

      String uri = 'http://$ip:3000/flutter/cart/$idData';

      final response = await http.get(Uri.parse(uri), headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      });

      if (response.statusCode == 200) {
        log("${response.statusCode}");
        log("${response.body}");
        log("........id Get............");
        log('$idData');
      }
    } catch (e) {
      // Handle errors here
      log('Error fetching data: $e');
    }
  }

  void addItemToCart(BuildContext context, dynamic idData) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('token');

      final response = await http.get(
        Uri.parse('http://$ip:3000/flutter/cart/$idData'),
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
            content: Text('Product added to cart'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Failed to add product to cart'),
          ),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Error adding product to cart'),
        ),
      );
    }
  }

// Assuming you have defined the removeItemFromCart method in the CartItemPass class
  void removeItemFromCart(BuildContext context, String idData) async {
    try {
      log('Deleting item from cart');
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('token');

      final response = await http.get(
        Uri.parse('http://$ip:3000/flutter/cart/delete/$idData'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        log('Item deleted successfully');
        // Perform any other necessary actions after deleting the item
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.blue,
            content: Text('Product deleted from cart'),
          ),
        );
      } else {
        log('Failed to delete item from cart. Status code: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Failed to delete product from cart'),
          ),
        );
      }
    } catch (e) {
      log('Error deleting product from cart: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Error deleting product from cart'),
        ),
      );
    }
  }

//////////////////////////////////////////////////

// Assuming you have defined the add value method in the CartItemPass class
  Future<void> valueAdd(BuildContext context, String idData) async {
    try {
      log('..........+.........');
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('token');

      final response = await http.get(
        Uri.parse('http://$ip:3000/flutter/cart/quantityadd/$idData'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        log('Add quantity................');
        notifyListeners();
        // Perform any other necessary actions after deleting the item
      } else {
        log('Failed to add value. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('error$e');
    }
  }

// Assuming you have defined the add value method in the CartItemPass class
  Future<void> valueMinus(BuildContext context, String idData) async {
    try {
      log('//////////---////////////');
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('token');

      final response = await http.get(
        Uri.parse('http://$ip:3000/flutter/cart/quantityminus/$idData'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        log('Minus quantity................');
        notifyListeners();
        // Perform any other necessary actions after deleting the item
      } else {
        log('Failed to minus value. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error to minus value: $e');
    }
  }
}
