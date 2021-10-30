class Album {
  String url;
  Album({
    required this.url,
  });

  Album copyWith({
    String? url,
  }) {
    return Album(
      url: url ?? this.url,
    );
  }
}
