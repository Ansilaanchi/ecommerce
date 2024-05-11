class Users {
  final String name;
  final String review;
  final String pic;
  final String subName;
  final String price;

  Users(this.name, this.review, this.pic, this.subName, this.price);
}

List users = [
  Users("nwertyuiytrtyuytyame", "review", "pic", "subName", "price"),
  Users("name", "review", "pic", "subName", "price"),
  Users("name", "review", "pic", "subName", "price"),
  Users("name", "review", "pic", "subName", "price"),
];

class User {
  final String name;

  final String img;

  User(
    this.name,
    this.img,
  );
}


List user = [
  User(
    "Fasion",
    // "assets/Custom-Printed-T-Shirt-Round-Neck.jpg",
    'assets/fashionable-model-stylish-hat-red-260nw-2035039067.webp'
  ),
  User(
    "Electronics",
    "assets/stc501000365_01_1693834881.webp",
  ),
  User(
    "Jwellery",
    "assets/indian_wear_for_kids_by_utsa.webp",
  ),
  User(
    "Fancy",
    "assets/shirt.webp",
  ),

  ];
