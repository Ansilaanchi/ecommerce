import 'dart:developer';
import 'package:fashion_world/search/searchGet.dart';
import 'package:fashion_world/search/searchitems/searchitems.dart';
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  final service = SearchService();
  bool isloading = false;
  Searchitems _data = Searchitems();
  Searchitems get data => _data;

  Future<void> getAllPosts(search) async {
    try {
      isloading = true;
      notifyListeners();
      final resn = await service.getAllThings(search);
      _data = resn;
      // Check if data is not null before accessing its properties
      if (_data.data != null) {
        log(_data.data!.name ?? "");
      }
      isloading = false;
      notifyListeners();
    } catch (e) {
      // Handle error
      isloading = false;
      notifyListeners();
      log('Error fetching search data: $e');
    }
  }
}
