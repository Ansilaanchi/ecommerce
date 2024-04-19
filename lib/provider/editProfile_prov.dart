import 'package:flutter/material.dart';

class EditProf extends ChangeNotifier {
  String name;
  int phone;
  String image;

  EditProf({
    this.name = 'name here',
    this.phone = 000000000,
    this.image = '',
  });

  void changeName({
    required String newname,
  }) {
    name = newname;
    notifyListeners();
  }

  void changephone({required int newPhone}) {
    phone = newPhone;
    notifyListeners();
  }
}
