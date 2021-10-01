import 'model/item.dart';

class CartRepository {
  List<Item> items = [];

  Future<List<Item>> getListItems() async {
    return items;
  }

  // Future<Item> addItemToList({required Item item}) async {
  //   return item;
  // }

  // Future<Item> delItemFromList({required Item item}) async {
  //   return item;
  // }

  // Future<Item> updateItemToList(
  //     {required Item item, required bool isDone}) async {
  //   // item.copyWith(isDone: !isDone);
  //   return item;
  // }
}
