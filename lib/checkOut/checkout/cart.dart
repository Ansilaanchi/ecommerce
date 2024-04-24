import 'item.dart';

class Cart {
  String? id;
  String? user;
  List<Item>? items;
  int? totalPrice;
  dynamic coupencode;
  dynamic discount;
  dynamic discountprice;
  int? v;

  Cart({
    this.id,
    this.user,
    this.items,
    this.totalPrice,
    this.coupencode,
    this.discount,
    this.discountprice,
    this.v,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json['_id'] as String?,
        user: json['user'] as String?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalPrice: json['totalPrice'] as int?,
        coupencode: json['coupencode'] as dynamic,
        discount: json['discount'] as dynamic,
        discountprice: json['discountprice'] as dynamic,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'user': user,
        'items': items?.map((e) => e.toJson()).toList(),
        'totalPrice': totalPrice,
        'coupencode': coupencode,
        'discount': discount,
        'discountprice': discountprice,
        '__v': v,
      };
}
