import 'model/item.dart';

class CartRepository {
  List<Item> items = [
    Item(title: '1', note: '1'),
    Item(title: '2', note: '2'),
    Item(title: '3', note: '3')
  ];

  Future<List<Item>> getListItems() async {
    return items;
  }

  Future<List<Item>> addItemToList({required Item item}) async {
    final newItem = Item(title: item.title, note: item.note);
    items.add(newItem);
    return items;
  }

  Future<List<Item>> delItemFromList({required Item item}) async {
    items.remove(item);
    return items;
  }
}
