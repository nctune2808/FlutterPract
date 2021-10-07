import 'package:shoping_list_bloc/model/item.dart';

class Cart {
  String? id;
  Item item;
  String note;
  bool isDone;

  Cart({
    this.id,
    required this.item,
    required this.note,
    required this.isDone,
  });

  Cart copyWith({
    String? id,
    Item? item,
    String? note,
    bool? isDone,
  }) {
    return Cart(
      id: id ?? this.id,
      item: item ?? this.item,
      note: note ?? this.note,
      isDone: isDone ?? this.isDone,
    );
  }
}
