import 'dart:convert';

class Property {
  String id;
  String title;
  double price;
  bool isUrgent;
  String type;
  String status;

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
    String? type,
    String? status,
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'isUrgent': isUrgent,
      'type': type,
      'status': status,
    };
  }

  factory Property.fromMap(Map<String, dynamic> map) {
    return Property(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      price: map['price'] ?? 0.0,
      isUrgent: map['isUrgent'] ?? false,
      type: map['type'] ?? '',
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Property.fromJson(String source) =>
      Property.fromMap(json.decode(source));
}
