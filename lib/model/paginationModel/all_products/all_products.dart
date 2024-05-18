class AllProductModel {
  List<Product>? product;
  int? totalPages;
  int? currentPage;
  List<int>? pages;

  AllProductModel({
    this.product,
    this.totalPages,
    this.currentPage,
    this.pages,
  });

  factory AllProductModel.fromJson(Map<String, dynamic> json) {
    return AllProductModel(
      product: (json['product'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] as int?,
      currentPage: json['currentPage'] as int?,
      pages: (json['pages'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(), // Correctly handle pages field
    );
  }

  Map<String, dynamic> toJson() => {
        'product': product?.map((e) => e.toJson()).toList(),
        'totalPages': totalPages,
        'currentPage': currentPage,
        'pages': pages,
      };
}

class Product {
  String? id;
  String? name;
  String? image;
  String? description;
  int? price;
  int? qty;
  String? category;
  int? v;

  Product({
    this.id,
    this.name,
    this.image,
    this.description,
    this.price,
    this.qty,
    this.category,
    this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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