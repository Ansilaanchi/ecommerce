import 'package:fashion_world/trackOrder/order/orderItemModel.dart';

class OrderHistory {
  List<Order>? order;

  OrderHistory({this.order});

  factory OrderHistory.fromJson(Map<String, dynamic> json) => OrderHistory(
        order: (json['order'] as List<dynamic>?)
            ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'order': order?.map((e) => e.toJson()).toList(),
      };
}
