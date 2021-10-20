part of 'post_bloc.dart';

class PostState {
  final Post? post;
  final Status? status;

  PostState({
    this.post,
    this.status = const StatusInitial(),
  });

  PostState copyWith({
    Post? post,
    Status? status,
  }) {
    return PostState(
      post: post ?? this.post,
      status: status ?? this.status,
    );
  }
}

class PostInitState extends PostState {}
