enum PropertyType {
  ACCOMMODATION,
  PROJECT,
  LAND,
}

enum PropertyStatus {
  SOLD,
  SELLING,
  TOSELL,
  LET,
  LETTING,
  TOLET,
}

class Property {
  String id;
  String title;
  double price;
  bool isUrgent;
  PropertyType type;
  PropertyStatus status;

  Property({
    required this.id,
    required this.title,
    required this.price,
    required this.isUrgent,
    required this.type,
    required this.status,
  });

  Property copyWith({
    String? id,
    String? title,
    double? price,
    bool? isUrgent,
    PropertyType? type,
    PropertyStatus? status,
  }) {
    return Property(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      isUrgent: isUrgent ?? this.isUrgent,
      type: type ?? this.type,
      status: status ?? this.status,
    );
  }
}
