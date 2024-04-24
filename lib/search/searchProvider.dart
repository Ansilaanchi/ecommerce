import 'dart:developer';
import 'package:fashion_world/editProfile/editGetData.dart';
import 'package:fashion_world/search/searchitems/searchitems.dart';
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  final service = ProfileService();
  bool isloading = false;
  Searchitems _data = Searchitems();
  Searchitems get data => _data;

  Future<void> getAllPosts() async {
    try {
      isloading = true;
      notifyListeners();
      final res = await service.getAll();
      _data = res;
      // Check if data is not null before accessing its properties
      if (_data.data != null) {
        log(_data.data!.email ?? "");
      }
      isloading = false;
      notifyListeners();
    } catch (e) {
      // Handle error
      isloading = false;
      notifyListeners();
      log('Error fetching profile data: $e');
    }
  }
}
