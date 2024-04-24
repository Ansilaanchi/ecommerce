// ignore_for_file: prefer_final_fields

import 'dart:developer';
import 'package:fashion_world/placeOrder/placeorder/placeorder.dart';
import 'package:flutter/material.dart';
import 'order.dart';

class OrderCreationProvider extends ChangeNotifier {
  OrderModel? _orderCreation;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  OrderModel? get orderCreation => _orderCreation;

  void createOrder(OrderModel orderCreation) {
    log('Order created: $orderCreation');
    _orderCreation = orderCreation;
    notifyListeners();
  }
}
