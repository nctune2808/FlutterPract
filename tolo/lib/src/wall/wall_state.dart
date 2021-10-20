part of 'wall_bloc.dart';

class WallState {
  final List<Post>? posts;
  final Status? status;

  WallState({
    this.posts,
    this.status = const StatusInitial(),
  });

  WallState copyWith({
    List<Post>? posts,
    Status? status,
  }) {
    return WallState(
      posts: posts ?? this.posts,
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
