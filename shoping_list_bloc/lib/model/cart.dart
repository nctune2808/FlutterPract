import 'package:shoping_list_bloc/model/item.dart';

class Cart {
  String? id;
  String title;
  String note;
  bool isDone;

  Cart({
    this.id,
    required this.title,
    required this.note,
    required this.isDone,
  });

  Cart copyWith({
    String? id,
    String? title,
    String? note,
    bool? isDone,
  }) {
    return Cart(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      isDone: isDone ?? this.isDone,
    );
  }
}
