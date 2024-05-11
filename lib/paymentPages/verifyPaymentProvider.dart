// ignore_for_file: unused_import
import 'dart:developer';
import 'package:fashion_world/ip.dart';
import 'package:fashion_world/paymentPages/verifyPayment.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyPaymentProvider extends ChangeNotifier {
  Future<void> verifyPayment(String paymentId, String orderId, String signature,
      String state, BuildContext context) async {
    log("Sending update request...");
    log("paymentId : $paymentId ");
    log("orderId : $orderId");
    log("signature : $signature");
    log("orderID : $state");

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('token');
      if (token == null) {
        throw Exception('Token not found');
      }

      var response = await http.post(
        Uri.parse('http://${ip}:3000/flutter/verifypayment'),
        body: {
          'paymentId': paymentId,
          'orderId': orderId,
          'signature': signature,
          'orderID': state,
        },
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );

      log('Response status code: ${response.statusCode}');
      log('Response body: ${response.body}');

      if (response.statusCode == 200) {
        log("Update successful");

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor: Colors.blue, content: Text("Done")));
       
      } else {
        throw Exception(
            'Failed to update user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log("Error: $e");
    }
  }
}
