// ignore_for_file: unnecessary_brace_in_string_interps, await_only_futures, unnecessary_string_interpolations, unused_import
import 'dart:convert';
import 'dart:developer';
import 'package:fashion_world/ip.dart';
import 'package:fashion_world/trackOrder/order/order.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrderHistoryService {
  Future<OrderHistory> getAll() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = await pref.getString('token');
    final response = await http.get(
      Uri.parse('http://${ip}:3000/flutter/orders'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    // log('${response.body}');
    // log('${response.headers}');
    if (response.statusCode == 200) {
      // log('successful');
      log('OrderHistory :  ${response.body}');

      return OrderHistory.fromJson(json.decode(response.body));
    }
    return OrderHistory();
  }
}