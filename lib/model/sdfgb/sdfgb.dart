import 'categorized_products.dart';

class Sdfgb {
  String? success;
  CategorizedProducts? categorizedProducts;
  String? username;
  int? count;
  String? wishlist;

  Sdfgb({
    this.success,
    this.categorizedProducts,
    this.username,
    this.count,
    this.wishlist,
  });

  factory Sdfgb.fromJson(Map<String, dynamic> json) => Sdfgb(
        success: json['success'] as String?,
        categorizedProducts: json['categorizedProducts'] == null
            ? null
            : CategorizedProducts.fromJson(
                json['categorizedProducts'] as Map<String, dynamic>),
        username: json['username'] as String?,
        count: json['count'] as int?,
        wishlist: json['wishlist'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'categorizedProducts': categorizedProducts?.toJson(),
        'username': username,
        'count': count,
        'wishlist': wishlist,
      };
}
