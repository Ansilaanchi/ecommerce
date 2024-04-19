// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps, await_only_futures

import 'dart:io';
import 'dart:typed_data';

import 'package:fashion_world/ip.dart';
import 'package:fashion_world/pages/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController nametextController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  Uint8List? _image;
  File? imageFile;
  File? selectedImage;
  List<File> img = <File>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Edit'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 55.sp,
                    backgroundImage: AssetImage(
                      'assets/blank-profile-picture-973460_960_720.webp',
                    ),
                  ),
                ),
                Positioned(
                  right: 120,
                  bottom: 10,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    child: IconButton(
                      onPressed: () {
                        showImagePickerOption(context);
                      },
                      icon: Icon(Icons.edit),
                    ),
                  ),
                )
              ],
            ),
            Center(
              child: Container(
                height: 8.h,
                width: 90.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: nametextController,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.person),
                      hintText: "Enter your name",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 8.h,
              width: 90.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: phoneController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter phone number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.phone),
                    hintText: "Enter phone number",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                update(nametextController.text, phoneController.text, context);
              },
              child: Container(
                height: 7.h,
                width: 90.w,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(child: Text('Update')),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> update(String name, String phoneno, BuildContext context) async {
    try {
      print("tyu");
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var token = await preferences.getString('token');
      var response = await post(
        Uri.parse("http://${ip}:3000/flutter/edituser"),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
        body: {
          'name': name,
          'phoneno': phoneno,
        },
      );

      // log(response.toString());
      print("Waiting...");

      if (response.statusCode == 200) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return ProfilePage();
        }));

        // var result = jsonDecode(response.body);
        // String? token = result['token'];
        // print(response.body);
        // print(response.statusCode);
        // print(token);
        //  homeData();
        //  print(homeData().toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: const Color.fromARGB(255, 199, 223, 243),
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 55,
                          ),
                          Text("Gallery"),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera,
                            size: 55,
                          ),
                          Text("Camera"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void getImage({required ImageSource source}) async {
    final MyFile = await ImagePicker().pickImage(source: source);
    if (MyFile == null) {
      return;
    }

    // setState(() {
    // img.add(File(MyFile.path));
    // });
  }

  // void getImage() async {
  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    // setState(() {
    //   selectedImage = File(returnImage.path);
    //   _image = File(returnImage.path).readAsBytesSync();
    // });
  }
}
