import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tolo/model/post.dart';
import 'package:tolo/src/wall/wall_repository.dart';
import 'package:tolo/utility/state/status.dart';

part 'wall_event.dart';
part 'wall_state.dart';

class WallBloc extends Bloc<WallEvent, WallState> {
  WallRepository _tlRepo = WallRepository.instance;
  WallBloc() : super(WallInitState());
  List<Post> posts = [];

  Stream<WallState> mapFetchEventToState(FetchWallEvent event) async* {
    posts = await _tlRepo.getPosts();
    // _tlRepo.streamPosts();
    yield state.copyWith(status: StatusSucess(), posts: posts);
  }

  @override
  Stream<WallState> mapEventToState(WallEvent event) async* {
    if (event is FetchWallEvent) {
      yield* mapFetchEventToState(event);
    }

    // if (event is RefreshTimelineEvent) {
    //   posts = await _tlRepo.getPosts();
    //   yield state.copyWith(status: StatusSucess(), posts: posts);
    // }
  }
}
