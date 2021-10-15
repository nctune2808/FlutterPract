import 'package:bloc/bloc.dart';
import 'package:tolo/model/post.dart';
import 'package:tolo/src/timeline/timeline_repository.dart';
import 'package:tolo/utility/state/form_submission_status.dart';

part 'timeline_event.dart';
part 'timeline_state.dart';

class TimelineBloc extends Bloc<TimelineEvent, TimelineState> {
  TimelineRepository _tlRepo = TimelineRepository.instance;
  TimelineBloc() : super(TimelineInitial());
  List<Post> posts = [];

  @override
  Stream<TimelineState> mapEventToState(TimelineEvent event) async* {
    if (event is LoadingTimelineEvent || event is PullToRefreshEvent) {
      posts = await _tlRepo.getPosts();
      yield TimelineStateSuccess(posts: posts);
    }

    if (event is AddTimelineEvent) {
      yield state.copyWith(formStatus: Submitting());
      try {
        await _tlRepo.insertPost(post: event.post);
        yield state.copyWith(formStatus: SubmissionSucess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(exception: e));
      }
    }

    if (event is UpdateTimelineEvent) {
      yield state.copyWith(formStatus: Submitting());
      try {
        await _tlRepo.updatePost(post: event.post);
        yield state.copyWith(formStatus: SubmissionSucess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(exception: e));
      }
    }
  }
}
