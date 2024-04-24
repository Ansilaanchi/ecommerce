import 'cart.dart';

class Checkout {
  Cart? cart;
  int? totalamount;
  int? count;

  Checkout({this.cart, this.totalamount, this.count});

  factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
        cart: json['cart'] == null
            ? null
            : Cart.fromJson(json['cart'] as Map<String, dynamic>),
        totalamount: json['totalamount'] as int?,
        count: json['count'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'cart': cart?.toJson(),
        'totalamount': totalamount,
        'count': count,
      };
}
