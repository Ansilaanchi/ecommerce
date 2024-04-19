import 'wishlist.dart';

class WishListmodel {
  List<Wishlist>? wishlist;

  WishListmodel({this.wishlist});

  factory WishListmodel.fromJson(Map<String, dynamic> json) => WishListmodel(
        wishlist: (json['wishlist'] as List<dynamic>?)
            ?.map((e) => Wishlist.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'wishlist': wishlist?.map((e) => e.toJson()).toList(),
      };
}
