class Payment {
  String? success;

  Payment({this.success});

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        success: json['success'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
      };
}
