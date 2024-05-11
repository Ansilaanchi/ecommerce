// ignore_for_file: file_names
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  bool isSelected = true;
  IconData favorite = Icons.favorite_border_rounded;
  void changeFavorite() {
    isSelected = !isSelected;
    favorite =
        isSelected ? Icons.favorite_border_rounded : Icons.favorite_rounded;
    notifyListeners();
  }
}