import 'dart:convert';

class Avatar {
  String? id;
  String? name;
  String? url;

  Avatar({this.id, this.name, this.url});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'url': url,
    };
  }

  factory Avatar.fromMap(Map<String, dynamic> map) {
    return Avatar(
      id: map['id'] != null ? map['id'] : null,
      name: map['name'] != null ? map['name'] : null,
      url: map['url'] != null ? map['url'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Avatar.fromJson(String source) => Avatar.fromMap(json.decode(source));
}
