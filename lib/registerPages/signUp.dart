import 'dart:convert';
import 'package:fashion_world/registerPages/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../ip.dart';
import '../pages/homePage.dart';
import '../verification/passwordVerif.dart';
import '../verification/verification screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  // static final String id = 'signup_screen';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phonenoController = TextEditingController();

  Future<void> signup(
    BuildContext context,
    String email,
    String password,
    String phoneno,
    String name,
  ) async {
    try {
      var response = await http.post(
        Uri.parse("http://${ip}:3000:3000/flutter/fuser_registration"),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {
          'name': name,
          'email': email,
          'password': password, // Removed extra space after 'Password'
          'phoneno': phoneno,
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        String? userid = result['userid'];
        if (userid != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('userid', userid);

          // Navigate to homepage if userid exists
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VarificationScreen()),
          );
        } else {
          // Display error message if userid is not received
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Try Again'),
                // Add any other necessary content to your dialog
              );
            },
          );
          print('userid not received.');
        }
      } else {
        // Display error message for non-200 status code
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed with status code: ${response.statusCode}'),
              // Add any other necessary content to your dialog
            );
          },
        );
        print('Request failed with status: ${response.body}.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 250,
                  width: 200,
                  child: Image.asset('assets/lock-removebg-preview.png'),
                ),
                Container(
                  height: 60,
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your name",
                      ),
                      validator: (input) => input!.trim().isEmpty
                          ? 'Please enter a valid name'
                          : null,
                      // onSaved: (input) => _name = input!,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your Email",
                      ),
                      validator: (input) => !input!.contains('@')
                          ? 'Please enter a valid email'
                          : null,
                      // onSaved: (input) => _email = input!,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: phonenoController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your Phone number",
                      ),
                      validator: (input) => input!.trim().isEmpty
                          ? 'Please enter a valid phoneNumber'
                          : null,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: passwordController,

                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your Password",
                      ),
                      validator: (input) => input!.length < 6
                          ? 'Must be at least 6 characters'
                          : null,
                      // onSaved: (input) => _password = input!,
                      obscureText: false,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contex) => OtpVarification()));
                    },
                    child: Text(
                      "forgot password?",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    )),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    signup(
                      context,
                      emailController.text.toString(),
                      passwordController.text.toString(),
                      phonenoController.text.toString(),
                      nameController.text.toString(),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 360,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Container(
                    height: 50,
                    width: 360,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Back to Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// Future<void> signup(String email, String password, String phoneno, String name) async {
//   try {
//     var response = await post(
//       Uri.parse("http://localhost:3000/flutter/fuser_registration"),
//       headers: {
//         "Content-Type": "application/x-www-form-urlencoded"
//       },
//       body: {
//         'email': email,
//         'password': password,
//         'name' : name,
//         'phoneno': phoneno,
//       },
//     );

//     if (response.statusCode == 200) {
//       var result = jsonDecode(response.body);
//       String? token = result['token'];

//       if (token != null) {
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.setString('token', token);

//         // Navigate to homepage if token exists
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => HomePage()),
//         );
//       } else {
//         // Display error message if token is not received
//         print('Token not received.');
//       }
//     } else {
//       // Display error message for non-200 status code
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   } catch (e) {
//     print(e.toString());
//   }
// }

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      // Logging in the user w/ Firebase
      // // String result = await AuthMethods().signUpUser(
      //     name: _name,
      //     email: _email,
      //     bio:_bio ,
      //     password: _password,
      //      username: _userName);
      // if (result != 'success') {
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    }
    setState(() {
      _isLoading = false;
    });
  }
}
