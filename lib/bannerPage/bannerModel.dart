import 'banner.dart';

class BannerModel {
  List<Banner>? banner;

  BannerModel({this.banner});

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        banner: (json['banner'] as List<dynamic>?)
            ?.map((e) => Banner.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        if (banner != null) 'banner': banner?.map((e) => e.toJson()).toList(),
      };
}
