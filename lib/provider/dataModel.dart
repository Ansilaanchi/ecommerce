import 'dart:developer';
import 'package:fashion_world/ip.dart';
import 'package:fashion_world/model/sdfgb/sdfgb.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

// Define your model classes here
// (CategorizedProducts, Electronic, Fancy, Fasion, Jwellery, Root)

class DataProvider with ChangeNotifier {
  // Define any state variables you want to manage here
  Sdfgb? _homeData;
  bool _isLoading = false;

  Sdfgb? get homeData => _homeData;
  bool get isLoading => _isLoading;

  // Function to fetch data from API
  Future<void> fetchData() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = await pref.getString('token');
      log('${token}');
      // Make the API call to fetch data
      final response = await http.get(
        Uri.parse('http://$ip:3000/flutter/fhome'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      log('Response Status Code: ${response.statusCode}');
// log('Response Body: ${response.body}');

      // Check if the response is successful
      if (response.statusCode == 200) {
        // log('sdfghjjjjjj');
        // Parse the response data into your model classes

        final jsonData = json.decode(response.body);
        if (jsonData != null && jsonData is Map<String, dynamic>) {
          // log(jsonData.toString() +
          // "--------------------------------------------");

          _homeData = Sdfgb.fromJson(json.decode(response.body));
          log(_homeData.toString());

          notifyListeners();
        } else {
          throw Exception('Invalid response data format');
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
