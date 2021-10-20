import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tolo/model/post.dart';
import 'package:tolo/src/wall/post/post_repository.dart';
import 'package:tolo/utility/state/Status.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitState());
  PostRepository postRepo = PostRepository.instance;

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is AddPostEvent) {
      try {
        Post post = await postRepo.insertPost(post: event.post);
        print("added");
        yield state.copyWith(status: StatusSucess(), post: post);
      } catch (e) {
        yield state.copyWith(status: StatusFailed(e: e));
      }
    }

    if (event is UpdatePostEvent) {
      try {
        Post post = await postRepo.updatePost(post: event.post);
        yield state.copyWith(status: StatusSucess(), post: post);
      } catch (e) {
        yield state.copyWith(status: StatusFailed(e: e));
      }
    }
  }
}
