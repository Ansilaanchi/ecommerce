import 'dart:developer';
import 'dart:io';
import 'package:fashion_world/ip.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart'; // Import the path_provider package
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
      // Initialize the path provider package
      final directory = await getExternalStorageDirectory();
      if (directory == null) {
        log('Failed to get external storage directory');
        return; // Return early if directory is null
      }

      final response = await http.get(
        Uri.parse('http://${ip}:3000/flutter/pdfController/${orderID}'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        log('InvoiceDownload Successful');

        // Get the directory for storing PDF files
        // final filePath = '${directory.path}/${orderID}.pdf';
        var filePath = "/storage/emulated/0/Download/Invocie ${orderID}.pdf";
        log(response.body);

        // Write PDF content to the file
        File pdfFile = File(filePath);
        await pdfFile.writeAsBytes(response.bodyBytes);

        log('PDF saved at: $filePath');
      } else {
        // Handle unsuccessful response
        log('InvoiceDownload Failed with status code: ${response.statusCode}');
        log(response.body);
      }
    } catch (error) {
      log('InvoiceDownload Error: $error');
    }
  }
}
