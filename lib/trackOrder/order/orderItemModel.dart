import 'item.dart';

class Order {
  String? id;
  String? orderId;
  DateTime? orderdate;
  String? email;
  String? name;
  String? address;
  String? city;
  String? state;
  String? pincode;
  String? phoneno;
  List<Item>? items;
  int? total;
  int? totalamount;
  String? status;
  String? paymentId;
  int? v;

  Order({
    this.id,
    this.orderId,
    this.orderdate,
    this.email,
    this.name,
    this.address,
    this.city,
    this.state,
    this.pincode,
    this.phoneno,
    this.items,
    this.total,
    this.totalamount,
    this.status,
    this.paymentId,
    this.v,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json['_id'] as String?,
        orderId: json['orderID'] as String?,
        orderdate: json['orderdate'] == null
            ? null
            : DateTime.parse(json['orderdate'] as String),
        email: json['email'] as String?,
        name: json['name'] as String?,
        address: json['address'] as String?,
        city: json['city'] as String?,
        state: json['state'] as String?,
        pincode: json['pincode'] as String?,
        phoneno: json['phoneno'] as String?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json['total'] as int?,
        totalamount: json['totalamount'] as int?,
        status: json['status'] as String?,
        paymentId: json['paymentID'] as String?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'orderID': orderId,
        'orderdate': orderdate?.toIso8601String(),
        'email': email,
        'name': name,
        'address': address,
        'city': city,
        'state': state,
        'pincode': pincode,
        'phoneno': phoneno,
        'items': items?.map((e) => e.toJson()).toList(),
        'total': total,
        'totalamount': totalamount,
        'status': status,
        'paymentID': paymentId,
        '__v': v,
      };
}