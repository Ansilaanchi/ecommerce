import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class ProviderService {
  getAll() async {
    const Url = '192.168.29.129:3000/flutter/fuser_signin';
  }

  signIn(String email, password) async {
    Map<String, dynamic> formMap = {
      "email": email,
      "password": password,
    };

    var response = await http.post(
        Uri.parse("http://192.168.29.129:3000/flutter/fuser_signin"),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: formMap);
    log((response.body.toString() + response.statusCode.toString()) as num);
    if (response.statusCode == 200) {
      // log("-----------------${response.body}---------------");
      var result = jsonDecode(response.body);
      if (result["login"]) {
        log(result["token"]);
      } else {}
    } else {
      // log("-----------------${response.body}---------------");
    }
  }
}
