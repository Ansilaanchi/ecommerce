class Fasion {
  String? id;
  String? name;
  String? image;
  String? description;
  int? price;
  int? qty;
  String? category;
  int? v;

  Fasion({
    this.id,
    this.name,
    this.image,
    this.description,
    this.price,
    this.qty,
    this.category,
    this.v,
  });

  factory Fasion.fromJson(Map<String, dynamic> json) => Fasion(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        description: json['description'] as String?,
        price: json['price'] as int?,
        qty: json['qty'] as int?,
        category: json['category'] as String?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'image': image,
        'description': description,
        'price': price,
        'qty': qty,
        'category': category,
        '__v': v,
      };
}
