part of 'timeline_bloc.dart';

class TimelineState {
  final List<Post>? posts;
  final FormSubmissionStatus formStatus;

  TimelineState({
    this.posts,
    this.formStatus = const InitialFormStatus(),
  });

  TimelineState copyWith({
    List<Post>? posts,
    FormSubmissionStatus? formStatus,
  }) {
    return TimelineState(
      posts: posts ?? this.posts,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

class TimelineInitial extends TimelineState {}

class TimelineStateSuccess extends TimelineState {
  final List<Post> posts;
  TimelineStateSuccess({
    required this.posts,
  });
}

class TimelineStateFailure extends TimelineState {
  final dynamic exception;
  TimelineStateFailure({
    required this.exception,
  });
}
