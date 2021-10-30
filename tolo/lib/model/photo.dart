class Photo {
  String url;
  String name;

  Photo({
    required this.url,
    required this.name,
  });

  Photo copyWith({
    String? url,
    String? name,
  }) {
    return Photo(
      url: url ?? this.url,
      name: name ?? this.name,
    );
  }
}
