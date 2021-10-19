import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tolo/model/post.dart';
import 'package:tolo/src/timeline/timeline_repository.dart';
import 'package:tolo/utility/state/Status.dart';

part 'timeline_event.dart';
part 'timeline_state.dart';

class TimelineBloc extends Bloc<TimelineEvent, TimelineState> {
  TimelineRepository _tlRepo = TimelineRepository.instance;
  TimelineBloc() : super(TimelineInitState());
  List<Post> posts = [];

  Stream<TimelineState> mapFetchEventToState(FetchTimelineEvent event) async* {
    posts = await _tlRepo.getPosts();
    // _tlRepo.streamPosts();
    yield state.copyWith(status: StatusSucess(), posts: posts);
  }

  @override
  Stream<TimelineState> mapEventToState(TimelineEvent event) async* {
    if (event is FetchTimelineEvent) {
      yield* mapFetchEventToState(event);
    }

    // if (event is RefreshTimelineEvent) {
    //   posts = await _tlRepo.getPosts();
    //   yield state.copyWith(status: StatusSucess(), posts: posts);
    // }
  }
}
