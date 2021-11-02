import 'dart:convert';

class Photo {
  int? id;
  String? path;
  String? url;
  String? type;
  DateTime? created_at;

  Photo({
    this.id,
    this.path,
    this.url,
    this.type,
    this.created_at,
  });

  Photo copyWith({
    int? id,
    String? path,
    String? url,
    String? type,
    DateTime? created_at,
  }) {
    return Photo(
      id: id ?? this.id,
      path: path ?? this.path,
      url: url ?? this.url,
      type: type ?? this.type,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'path': path,
      'url': url,
      'type': type,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      id: map['id'] != null ? map['id'] : null,
      path: map['path'] != null ? map['path'] : null,
      url: map['url'] != null ? map['url'] : null,
      type: map['type'] != null ? map['type'] : null,
      created_at: DateTime.parse(map['created_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) => Photo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Photo(id: $id, path: $path, url: $url, type: $type, created_at: $created_at)';
  }
}
