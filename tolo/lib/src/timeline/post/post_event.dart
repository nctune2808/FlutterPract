part of 'post_bloc.dart';

class PostEvent {}

class InitPostEvent extends PostEvent {}

// class FetchPostEvent extends PostEvent {
//   Post post;
//   FetchPostEvent({
//     required this.post,
//   });
// }

class AddPostEvent extends PostEvent {
  Post post;
  AddPostEvent({
    required this.post,
  });
}

class DeletePostEvent extends PostEvent {
  Post post;
  DeletePostEvent({
    required this.post,
  });
}

class UpdatePostEvent extends PostEvent {
  Post post;
  UpdatePostEvent({
    required this.post,
  });
}
