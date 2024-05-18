// ignore_for_file: unnecessary_brace_in_string_interps, await_only_futures, unnecessary_string_interpolations, unused_import, file_names
import 'dart:convert';
import 'dart:developer';
import 'package:fashion_world/ip.dart';
import 'package:fashion_world/model/paginationModel/all_products/all_products.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PaginationService {
  Future<AllProductModel> getAll(int page) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = await pref.getString('token');
    final response = await http.get(
      Uri.parse('http://${ip}:3000/flutter/allproducts/$page'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      log('PaginationService Successful');
      log(response.body);

      return AllProductModel.fromJson(json.decode(response.body));
    }
    return AllProductModel();
  }
}