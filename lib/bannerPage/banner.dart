class Banner {
  String? id;
  String? image;
  String? description;
  bool? isActive;
  num? v;
  String? first;
  String? second;

  Banner({
    this.id,
    this.image,
    this.description,
    this.isActive,
    this.v,
    this.first,
    this.second,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json['_id']?.toString(),
        image: json['image']?.toString(),
        description: json['description']?.toString(),
        isActive: json['isActive']?.toString().contains("true"),
        v: num.tryParse(json['__v'].toString()),
        first: json['first']?.toString(),
        second: json['second']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) '_id': id,
        if (image != null) 'image': image,
        if (description != null) 'description': description,
        if (isActive != null) 'isActive': isActive,
        if (v != null) '__v': v,
        if (first != null) 'first': first,
        if (second != null) 'second': second,
      };
}
