import 'model/item.dart';

class CartRepository {
  List<Item> items = [
    Item(title: '1', note: '1', isDone: false),
    Item(title: '2', note: '2', isDone: true),
    Item(title: '3', note: '3', isDone: false)
  ];

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
