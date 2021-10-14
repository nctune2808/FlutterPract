import 'package:bloc/bloc.dart';
import 'package:shoping_list_bloc/model/post.dart';
import 'package:shoping_list_bloc/src/timeline/timeline_repository.dart';
import 'package:shoping_list_bloc/utility/state/form_submission_status.dart';

part 'timeline_event.dart';
part 'timeline_state.dart';

class TimelineBloc extends Bloc<TimelineEvent, TimelineState> {
  TimelineRepository _tlRepo = TimelineRepository.instance;
  TimelineBloc() : super(TimelineState());

  @override
  Stream<TimelineState> mapEventToState(TimelineEvent event) async* {
    if (event is LoadingTimelineEvent || event is PullToRefreshEvent) {
      List<Post> posts = await _tlRepo.getPosts();
      // print(posts);
      yield TimelineStateSuccess(posts: posts);
    }
  }
}
