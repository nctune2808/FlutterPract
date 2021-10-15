import 'package:bloc/bloc.dart';
import 'package:tolo/model/post.dart';
import 'package:tolo/src/timeline/post/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial());
  PostRepository postRepo = PostRepository.instance;

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is AddPostEvent) {
      yield state.copyWith(status: PostStatus.loading);
      try {
        await postRepo.insertPost(post: event.post);
        yield state.copyWith(status: PostStatus.success);
      } catch (e) {
        yield state.copyWith(status: PostStatus.failure);
      }
    }

    if (event is UpdatePostEvent) {
      yield state.copyWith(status: PostStatus.loading);
      try {
        Post post = await postRepo.updatePost(post: event.post);
        yield state.copyWith(status: PostStatus.success, post: post);
      } catch (e) {
        yield state.copyWith(status: PostStatus.failure);
      }
    }
  }
}