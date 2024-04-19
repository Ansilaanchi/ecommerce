/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class CategorizedProducts {
  List<Fasion?>? fasion;
  List<Electronic?>? electronics;
  List<Jwellery?>? jwellery;
  List<Fancy?>? fancy;

  CategorizedProducts(
      {this.fasion, this.electronics, this.jwellery, this.fancy});

  CategorizedProducts.fromJson(Map<String, dynamic> json) {
    if (json['fasion'] != null) {
      fasion = <Fasion>[];
      json['fasion'].forEach((v) {
        fasion!.add(Fasion.fromJson(v));
      });
    }
    if (json['electronics'] != null) {
      electronics = <Electronic>[];
      json['electronics'].forEach((v) {
        electronics!.add(Electronic.fromJson(v));
      });
    }
    if (json['jwellery'] != null) {
      jwellery = <Jwellery>[];
      json['jwellery'].forEach((v) {
        jwellery!.add(Jwellery.fromJson(v));
      });
    }
    if (json['fancy'] != null) {
      fancy = <Fancy>[];
      json['fancy'].forEach((v) {
        fancy!.add(Fancy.fromJson(v));
      });
    }
  }

  // get jewelry => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['fasion'] =
        fasion != null ? fasion!.map((v) => v?.toJson()).toList() : null;
    data['electronics'] = electronics != null
        ? electronics!.map((v) => v?.toJson()).toList()
        : null;
    data['jwellery'] =
        jwellery != null ? jwellery!.map((v) => v?.toJson()).toList() : null;
    data['fancy'] =
        fancy != null ? fancy!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}

class Electronic {
  String? id;
  String? name;
  String? image;
  String? description;
  int? price;
  int? qty;
  String? category;
  int? v;

  Electronic(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.price,
      this.qty,
      this.category,
      this.v});

  Electronic.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    qty = json['qty'];
    category = json['category'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['price'] = price;
    data['qty'] = qty;
    data['category'] = category;
    data['__v'] = v;
    return data;
  }
}

class Fancy {
  String? id;
  String? name;
  String? image;
  String? description;
  int? price;
  int? qty;
  String? category;
  int? v;

  Fancy(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.price,
      this.qty,
      this.category,
      this.v});

  Fancy.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    qty = json['qty'];
    category = json['category'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['price'] = price;
    data['qty'] = qty;
    data['category'] = category;
    data['__v'] = v;
    return data;
  }
}

class Fasion {
  String? id;
  String? name;
  String? image;
  String? description;
  int? price;
  int? qty;
  String? category;
  int? v;

  Fasion(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.price,
      this.qty,
      this.category,
      this.v});

  Fasion.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    qty = json['qty'];
    category = json['category'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['price'] = price;
    data['qty'] = qty;
    data['category'] = category;
    data['__v'] = v;
    return data;
  }
}

class Jwellery {
  String? id;
  String? name;
  String? image;
  String? description;
  int? price;
  int? qty;
  String? category;
  int? v;

  Jwellery(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.price,
      this.qty,
      this.category,
      this.v});

  Jwellery.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    qty = json['qty'];
    category = json['category'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['price'] = price;
    data['qty'] = qty;
    data['category'] = category;
    data['__v'] = v;
    return data;
  }
}

class Root {
  CategorizedProducts? categorizedProducts;

  Root({this.categorizedProducts});

  Root.fromJson(Map<String, dynamic> json) {
    categorizedProducts = json['categorizedProducts'] != null
        ? CategorizedProducts?.fromJson(json['categorizedProducts'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['categorizedProducts'] = categorizedProducts!.toJson();
    return data;
  }
}
