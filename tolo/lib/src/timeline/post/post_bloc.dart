import 'package:bloc/bloc.dart';
import 'package:tolo/model/post.dart';
import 'package:tolo/src/timeline/post/post_repository.dart';
import 'package:tolo/utility/state/Status.dart';
import 'package:tolo/utility/state/form_submission_status.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial());
  PostRepository postRepo = PostRepository.instance;

  // Stream<PostState> mapFetchPostToState(FetchPostEvent event) async* {
  //   Post post = await postRepo.getPostById(post: event.post);
  //   yield state.copyWith(status: StatusInitial(), post: post);
  // }

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    // if (event is FetchPostEvent) {
    //   yield* mapFetchPostToState(event);
    // }

    if (event is AddPostEvent) {
      // yield state.copyWith(status: StatusLoading());
      try {
        Post post = await postRepo.insertPost(post: event.post);
        print("added");
        yield state.copyWith(status: StatusSucess(), post: post);
      } catch (e) {
        yield state.copyWith(status: StatusFailed(e: e));
      }
    }

    if (event is UpdatePostEvent) {
      // yield state.copyWith(status: StatusLoading());
      try {
        Post post = await postRepo.updatePost(post: event.post);
        yield state.copyWith(status: StatusSucess(), post: post);
      } catch (e) {
        yield state.copyWith(status: StatusFailed(e: e));
      }
    }
  }
}
