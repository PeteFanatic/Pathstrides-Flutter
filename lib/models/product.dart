class Product {
  // int? id;
  // String? title;
  // num? price;
  // String? category;
  // String? description;
  // String? image;

  int points = 0;
  int points_id = 0;
  int user_id = 0;
  String points_name = "";

  Product(this.points, this.points_id, this.user_id, this.points_name);

  Product.fromJson(Map json)
      : points_id = json['points_id'],
        points_name = json['points_name'],
        points = json['points'],
        user_id = json['user_id'];
}
