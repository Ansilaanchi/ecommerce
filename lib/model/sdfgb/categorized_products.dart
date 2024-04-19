import 'electronic.dart';
import 'fancy.dart';
import 'fasion.dart';
import 'jwellery.dart';

class CategorizedProducts {
  List<Fasion>? fasion;
  List<Electronic>? electronics;
  List<Jwellery>? jwellery;
  List<Fancy>? fancy;

  CategorizedProducts({
    this.fasion,
    this.electronics,
    this.jwellery,
    this.fancy,
  });

  factory CategorizedProducts.fromJson(Map<String, dynamic> json) {
    return CategorizedProducts(
      fasion: (json['fasion'] as List<dynamic>?)
          ?.map((e) => Fasion.fromJson(e as Map<String, dynamic>))
          .toList(),
      electronics: (json['electronics'] as List<dynamic>?)
          ?.map((e) => Electronic.fromJson(e as Map<String, dynamic>))
          .toList(),
      jwellery: (json['jwellery'] as List<dynamic>?)
          ?.map((e) => Jwellery.fromJson(e as Map<String, dynamic>))
          .toList(),
      fancy: (json['fancy'] as List<dynamic>?)
          ?.map((e) => Fancy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'fasion': fasion?.map((e) => e.toJson()).toList(),
        'electronics': electronics?.map((e) => e.toJson()).toList(),
        'jwellery': jwellery?.map((e) => e.toJson()).toList(),
        'fancy': fancy?.map((e) => e.toJson()).toList(),
      };
}
