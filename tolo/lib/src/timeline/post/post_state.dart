part of 'post_bloc.dart';

enum PostStatus { initial, loading, success, failure }

class PostState {
  final Post? post;
  final PostStatus? status;

  PostState({
    this.post,
    this.status,
  });

  PostState copyWith({
    Post? post,
    PostStatus? status,
  }) {
    return PostState(
      post: post ?? this.post,
      status: status ?? this.status,
    );
  }
}

class PostInitial extends PostState {}
