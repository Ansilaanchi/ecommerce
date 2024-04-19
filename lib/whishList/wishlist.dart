import 'product.dart';

class Wishlist {
  Product? product;
  String? id;

  Wishlist({this.product, this.id});

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'product': product?.toJson(),
        '_id': id,
      };
}
