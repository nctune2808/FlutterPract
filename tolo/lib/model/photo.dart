import 'dart:convert';

class Photo {
  int? id;
  String url;
  String name;
  DateTime? created_at;

  Photo({
    this.id,
    required this.url,
    required this.name,
    this.created_at,
  });

  Photo copyWith({
    int? id,
    String? url,
    String? name,
    DateTime? created_at,
  }) {
    return Photo(
      id: id ?? this.id,
      url: url ?? this.url,
      name: name ?? this.name,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'name': name,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      id: map['id'],
      url: map['url'],
      name: map['name'],
      created_at: DateTime.parse(map['created_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) => Photo.fromMap(json.decode(source));
}
