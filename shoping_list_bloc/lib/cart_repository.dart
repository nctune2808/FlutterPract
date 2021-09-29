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

  Future<List<Item>> addItemToList({required Item item}) async {
    final newItem = Item(
      title: item.title,
      note: item.note,
      isDone: item.isDone,
    );
    items.add(newItem);
    return items;
  }

  Future<List<Item>> delItemFromList({required Item item}) async {
    items.remove(item);
    return items;
  }
}
