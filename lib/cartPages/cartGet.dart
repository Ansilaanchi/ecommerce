class CartGet {
  String? success;
  Data? data;
  int? count;
  int? total;

  CartGet({this.success, this.data, this.count, this.total});

  CartGet.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    count = json['count'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['count'] = this.count;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  String? sId;
  String? user;
  List<Items>? items;
  int? totalPrice;
  Null coupencode;
  Null discount;
  Null discountprice;
  int? iV;

  Data(
      {this.sId,
      this.user,
      this.items,
      this.totalPrice,
      this.coupencode,
      this.discount,
      this.discountprice,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
    coupencode = json['coupencode'];
    discount = json['discount'];
    discountprice = json['discountprice'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['totalPrice'] = this.totalPrice;
    data['coupencode'] = this.coupencode;
    data['discount'] = this.discount;
    data['discountprice'] = this.discountprice;
    data['__v'] = this.iV;
    return data;
  }
}

class Items {
  Product? product;
  int? quantity;
  String? size;
  String? sId;

  Items({this.product, this.quantity, this.size, this.sId});

  Items.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    quantity = json['quantity'];
    size = json['size'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['quantity'] = this.quantity;
    data['size'] = this.size;
    data['_id'] = this.sId;
    return data;
  }
}

class Product {
  String? sId;
  String? name;
  String? image;
  String? description;
  int? price;
  int? qty;
  String? category;
  int? iV;

  Product(
      {this.sId,
      this.name,
      this.image,
      this.description,
      this.price,
      this.qty,
      this.category,
      this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    qty = json['qty'];
    category = json['category'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['price'] = this.price;
    data['qty'] = this.qty;
    data['category'] = this.category;
    data['__v'] = this.iV;
    return data;
  }
}
