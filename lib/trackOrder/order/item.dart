import 'product.dart';

class Item {
  Product? product;
  int? quantity;
  String? size;
  String? id;

  Item({this.product, this.quantity, this.size, this.id});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
        quantity: json['quantity'] as int?,
        size: json['size'] as String?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'product': product?.toJson(),
        'quantity': quantity,
        'size': size,
        '_id': id,
      };
}
