class ShopData {
  List<ShopItem> shopitems;

  ShopData({required this.shopitems});
}

class ShopItem {
  String points_name;
  int points;

  ShopItem({required this.points_name, required this.points});
}
