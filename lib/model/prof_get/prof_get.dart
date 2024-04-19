import 'data.dart';

class ProfileData {
  String? success;
  Data? data;

  ProfileData({this.success, this.data});

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        success: json['success'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.toJson(),
      };
}
