// ignore_for_file: camel_case_types, no_leading_underscores_for_local_identifiers, unnecessary_brace_in_string_interps, await_only_futures, avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:fashion_world/ip.dart';
import 'package:fashion_world/paymentPages/payment1.dart';
import 'package:fashion_world/placeOrder/placeorder/orderCreation.dart';
import 'package:fashion_world/placeOrder/placeorder/placeorder.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({Key? key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController stateController = TextEditingController();
    final TextEditingController pincodeController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CheckOut',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView(
        children: [
          Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(height: 10),
                Container(
                  height: 70.h,
                  width: 90.w,
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      checkoutText(
                        keyboardType: TextInputType.phone,
                        controller: nameController,
                        hintText: 'Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      checkoutText(
                        keyboardType: TextInputType.phone,
                        controller: addressController,
                        hintText: 'Address',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your Address";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      checkoutText(
                        keyboardType: TextInputType.phone,
                        controller: cityController,
                        hintText: 'City',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your City";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      checkoutText(
                        keyboardType: TextInputType.phone,
                        controller: stateController,
                        hintText: 'State',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your State";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      checkoutText(
                        keyboardType: TextInputType.number,
                        controller: pincodeController,
                        hintText: 'Pincode',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your Pincode";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      checkoutText(
                        keyboardType: TextInputType.number,
                        controller: phoneController,
                        hintText: 'Phone Number',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your Phone Number";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      placeAddress(
                          context,
                          nameController.text.toString(),
                          addressController.text.toString(),
                          cityController.text.toString(),
                          stateController.text.toString(),
                          pincodeController.text.toString(),
                          phoneController.text.toString());
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> placeAddress(
    BuildContext context,
    String name,
    String phoneno,
    String address,
    String state,
    String city,
    String pincode,
  ) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var token = preferences.getString('token');
      var response = await http.post(
        Uri.parse("http://${ip}:3000/flutter/placeorder"),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          'name': name,
          'phoneno': phoneno,
          'address': address,
          'city': city,
          'state': state,
          'pincode': pincode,
          'paymentMethod': 'razorpay',
        },
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var orderModel = OrderModel.fromJson(jsonData);

        Provider.of<OrderCreationProvider>(context, listen: false)
            .createOrder(orderModel);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaymentPage()),
        );

        log('......order confirmed........');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

class checkoutText extends StatelessWidget {
  const checkoutText({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validator,
    required this.keyboardType,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: 80.w,
      decoration: BoxDecoration(border: Border.all(),
      borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
          
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
