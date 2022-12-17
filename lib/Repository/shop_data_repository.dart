import '../Models/shop.dart';

class ShopDataProvider {
  Future<ShopData> getShopItems() async {
    List<ShopItem> shopItems = [
      ShopItem(
        points_name: 'Item 1',
        points: 200,
      ),
      ShopItem(
        points_name: 'Item 2',
        points: 250,
      ),
      ShopItem(
        points_name: 'Item 3',
        points: 300,
      ),
    ];
    return ShopData(shopitems: shopItems);
  }

  Future<ShopData> getCartItems() async {
    List<ShopItem> shopItems = [
      ShopItem(
        points_name: 'Item 1',
        points: 200,
      ),
      ShopItem(
        points_name: 'Item 2',
        points: 250,
      ),
      ShopItem(
        points_name: 'Item 3',
        points: 300,
      ),
    ];
    return ShopData(shopitems: shopItems);
  }
}
