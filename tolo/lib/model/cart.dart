import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'note': note,
      'isDone': isDone,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      title: map['title'],
      note: map['note'],
      isDone: map['isDone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));
}
