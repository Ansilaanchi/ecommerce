import 'dart:developer';
import 'dart:io';
import 'package:fashion_world/ip.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InvoiceApi extends ChangeNotifier {
  Future<void> addOrderID(dynamic orderID) async {
    log('InvoiceDownload : $orderID');
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    if (token == null) {
      log('Token not found');
      return; // Return early if token is null
    }

    try {
      final response = await http.get(
        Uri.parse('http://${ip}:3000/flutter/pdfController/$orderID'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        log('InvoiceDownload Successful');
        var path= "/storage/emulated/0/Download/Invocie ${orderID}.pdf";

        var file= File(path);
      await  file.writeAsBytes(response.bodyBytes);
     
          log('mmmmmmmmmmmmmmmmmmmmm');
            log('Response body: ${response.body}');

        } 
       
      else {
        log('InvoiceDownload Failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      log('InvoiceDownload Error: $error');
    }
  }

}