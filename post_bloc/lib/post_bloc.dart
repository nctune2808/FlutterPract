import 'package:flutter_bloc/flutter_bloc.dart';

import 'data_service.dart';
import 'post.dart';

// create ----------------------------Event----------------------------
abstract class PostsEvent {}

// even1: LoadPost
class LoadPostsEvent extends PostsEvent {}

// event2: Refresh
class PullToRefreshEvent extends PostsEvent {}

// create ----------------------------State----------------------------
abstract class PostsState {}

// state1: Loading
class LoadingPostsState extends PostsState {}

// state2: Loaded
class LoadedPostsState extends PostsState {
  List<Post> posts;
  LoadedPostsState({required this.posts});
}

// state3: Fail to load
class FailToLoadPostsState extends PostsState {
  Object err;
  FailToLoadPostsState({required this.err});
}

// create ----------------------------Bloc----------------------------
// mapping Event and State to fetch data
class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final _dataService = DataService();
  PostsBloc() : super(LoadingPostsState());

  @override
  Stream<PostsState> mapEventToState(PostsEvent event) async* {
    if (event is LoadPostsEvent || event is PullToRefreshEvent) {
      yield LoadingPostsState();
      try {
        final posts = await _dataService.getPosts();
        yield LoadedPostsState(posts: posts);
      } catch (e) {
        yield FailToLoadPostsState(err: e);
      }
    }
  }
}
