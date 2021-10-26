part of 'wall_bloc.dart';

class WallState {
  final List<Wall>? walls;
  final Status? status;

  WallState({
    this.walls,
    this.status = const StatusInitial(),
  });

  WallState copyWith({
    List<Wall>? walls,
    Status? status,
  }) {
    return WallState(
      walls: walls ?? this.walls,
      status: status ?? this.status,
    );
  }
}

class WallInitState extends WallState {}

class WallStreamState extends WallState {
  Stream<QueryResult>? stream;
  Status? status;

  WallStreamState({this.stream, this.status});
}
