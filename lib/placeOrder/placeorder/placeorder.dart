import 'order.dart';

class OrderModel {
  String? success;
  Order? order;

  OrderModel({this.success, this.order});

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        success: json['success'] as String?,
        order: json['order'] == null
            ? null
            : Order.fromJson(json['order'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'order': order?.toJson(),
      };
}
