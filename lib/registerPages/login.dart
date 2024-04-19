import 'dart:convert';
import 'dart:math';

// import 'package:fashion_world/pages/home.dart';
import 'package:fashion_world/commonWidget/homeData.dart';
import 'package:fashion_world/registerPages/signUp.dart';
import 'package:fashion_world/registerPages/terms.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ip.dart';
import '../pages/homePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  Future<void> login(String email, String password) async {
    try {
      print("tyu");
      var response = await post(
        Uri.parse("http://${ip}:3000/flutter/fuser_signin"),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {
          'email': email,
          'password': password,
        },
      );

      // log(response.toString());
      print("Waiting...");

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        String? token = result['token'];
        print(response.body);
        print(response.statusCode);
        print(token);
        //  homeData();
        //  print(homeData().toString());

        if (token != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);
          await prefs.setBool('userlogin', true);

          // Navigate to homepage if token exists
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text('Succssfully'),
          ));
        } else {
          // Display error message if token is not received
          print('Token not received.');
        }
      } else {
        // Display error message for non-200 status code
        print('Request failed with status: ${response.statusCode}.');

        print('Request failed with status: ${response.body}.');

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text('Invalid'),
        ));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  bool isObscurePassword = true;
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              "Create Account",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Fill your information below or register\n with your social Account",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/mgb-removebg-preview.png',
                height: 150,
                width: 200,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: emailController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.email),
                    hintText: "Enter your Email",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: passwordController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.lock),
                    hintText: "Enter your Password",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(children: [
                Checkbox(
                  value: agree,
                  onChanged: (value) {
                    setState(() {
                      agree = value!;
                    });
                  },
                ),
                Text('Agree with'),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TermsConditions(),
                      ),
                    );
                  },
                  child: Text(
                    ' Terms & Conditions',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue),
                  ),
                ),
              ]),
            ),
            GestureDetector(
              onTap: () {
                login(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const SizedBox(
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Row(
                  children: [
                    Expanded(child: Divider()),
                    Text(" Or Login with "),
                    Expanded(child: Divider()),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  netCo("assets/Vector.png"),
                  netCo("assets/Group 123.png"),
                  netCo("assets/cib_apple.png"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 60),
              child: Row(
                children: [
                  Text(
                    "Don’t have an account?",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      " Register Now",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container netCo(String image) {
    return Container(
      height: 70,
      width: 110,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(31, 5, 5, 5)),
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
      ),
      child: Image(image: AssetImage(image)),
    );
  }
}
