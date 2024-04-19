// ignore_for_file: camel_case_types, unnecessary_brace_in_string_interps, await_only_futures, non_constant_identifier_names
import 'dart:convert';
import 'dart:developer';
import 'package:fashion_world/ip.dart';
import 'package:fashion_world/model/categorizedmodel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeGetData {
  Future<CategorizedProducts> HomeGetDat() async {
    try {
      log('aaaaaaaaaaaaaaaa');
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = await pref.getString('token');
      // log("$token");
      print('kkkkkkkkkkkkkkkkkkkkkkkkkkk');

      log('${token}');
      final response = await http.get(
        Uri.parse('http://${ip}:3000/flutter/fhome'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      log('hhhhhhhhhhhhh${response.body}');

      log('${response.headers}');
      log('ssssssssssssss${response.body}');
      log('aaaaaaaaaaaaaaaaaaaaaa${response.statusCode}');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return CategorizedProducts.fromJson(jsonData['CategorizedProducts']);
        // return CategorizedProducts.fromJson(json.decode(response.body));
      } else {
        throw Exception();
      }
    } catch (e) {
      // log('Error$e');

      throw Exception("");
    }
  }
}
