// ignore_for_file: file_names, unnecessary_brace_in_string_interps, use_build_context_synchronously
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:fashion_world/ip.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImgProvider extends ChangeNotifier {
  File? _imageFile;

  // Getter for the image file named as 'img'
  File? get img => _imageFile;

  void getImage({required ImageSource source}) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile == null) {
      return;
    }

    _imageFile = File(pickedFile.path);
    notifyListeners();
  }

  Future<void> updateImage(File profilePicture, BuildContext context) async {
    log("Sending update request...");
    log("Profile picture: $profilePicture");

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('token'); // Removed 'await' here
      if (token == null) {
        throw Exception('Token not found');
      }

      // Read the file as bytes
      List<int> imageBytes = await profilePicture.readAsBytes();

      // Encode the bytes to base64
      String base64Image = base64Encode(imageBytes);

      var response = await http.post(
        Uri.parse('http://${ip}:3000/flutter/edituser'),
        body: {
          'image': base64Image, // Pass the base64 string
        },
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );

      log('Response status code: ${response.statusCode}');
      log('Response body: ${response.body}');

      if (response.statusCode == 200) {
        log("Profile picture successful");

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.blue,
          content: Text("Profile updated successfully..."),
        ));
      } else {
        throw Exception(
          'Failed to update user. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      log("Error: $e");
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred while updating user: $e'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}