class Goal {
  int home;
  int away;

  Goal({
    required this.home,
    required this.away,
  });

  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(home: json['home'], away: json['away']);
  }
}
