import 'verification.dart';

class Data {
  Verification? verification;
  String? id;
  String? role;
  String? name;
  String? email;
  int? phoneno;
  String? password;
  bool? isverified;
  DateTime? dateCreated;
  int? v;

  Data({
    this.verification,
    this.id,
    this.role,
    this.name,
    this.email,
    this.phoneno,
    this.password,
    this.isverified,
    this.dateCreated,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        verification: json['verification'] == null
            ? null
            : Verification.fromJson(
                json['verification'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        role: json['role'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phoneno: json['phoneno'] as int?,
        password: json['password'] as String?,
        isverified: json['isverified'] as bool?,
        dateCreated: json['dateCreated'] == null
            ? null
            : DateTime.parse(json['dateCreated'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'verification': verification?.toJson(),
        '_id': id,
        'role': role,
        'name': name,
        'email': email,
        'phoneno': phoneno,
        'password': password,
        'isverified': isverified,
        'dateCreated': dateCreated?.toIso8601String(),
        '__v': v,
      };
}
