class Status {
  int elapsedTime;
  String long;

  Status({
    required this.elapsedTime,
    required this.long,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      elapsedTime: json['elapsed'],
      long: json['long'],
    );
  }
}
