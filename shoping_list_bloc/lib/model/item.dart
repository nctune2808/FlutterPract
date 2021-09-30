class Item {
  String title;
  String note;
  bool isDone;

  Item({
    required this.title,
    required this.note,
    required this.isDone,
  });

  Item copyWith({
    String? title,
    String? note,
    bool? isDone,
  }) {
    return Item(
      title: title ?? this.title,
      note: note ?? this.note,
      isDone: isDone ?? this.isDone,
    );
  }
}
