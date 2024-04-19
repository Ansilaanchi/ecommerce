class Verification {
  String? code;
  DateTime? expiry;

  Verification({this.code, this.expiry});

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
        code: json['code'] as String?,
        expiry: json['expiry'] == null
            ? null
            : DateTime.parse(json['expiry'] as String),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'expiry': expiry?.toIso8601String(),
      };
}
