part of 'timeline_bloc.dart';

class TimelineState {
  final List<Post>? posts;
  final Status? status;

  TimelineState({
    this.posts,
    this.status = const StatusInitial(),
  });

  TimelineState copyWith({
    List<Post>? posts,
    Status? status,
  }) {
    return TimelineState(
      posts: posts ?? this.posts,
      status: status ?? this.status,
    );
  }
}

class TimelineInitState extends TimelineState {}

class TimelineStreamState extends TimelineState {
  Stream<QueryResult>? stream;
  Status? status;

  TimelineStreamState({this.stream, this.status});
}
