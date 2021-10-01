import 'model/item.dart';

class CartRepository {
  List<Item> items = [
    Item(title: 'pork', note: 'x2', isDone: false),
    Item(title: 'beaf', note: 'x1', isDone: false),
    Item(title: 'eggs', note: 'x1', isDone: true),
    Item(title: 'milk', note: 'x2', isDone: false),
    Item(title: 'cake', note: 'x3', isDone: false),
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
