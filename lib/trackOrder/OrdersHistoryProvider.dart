
import 'package:fashion_world/trackOrder/order/order.dart';
import 'package:fashion_world/trackOrder/orderService.dart';
import 'package:flutter/material.dart';

class OrdersHistoryProvider extends ChangeNotifier {
  final service = OrderHistoryService();
  bool isloading = false;
  OrderHistory _orderHistory = OrderHistory();
  OrderHistory get orderHistory => _orderHistory;
  getAllPosts() async {
    isloading = true;
    notifyListeners();
    final res = await service.getAll();
    _orderHistory = res;

    isloading = false;
    notifyListeners();
  }
}