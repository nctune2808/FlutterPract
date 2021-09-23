//
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_bloc/post_bloc.dart';

import 'data_service.dart';
import 'post.dart';

// abstract class NavEvent {}

// //
// class LoadNavEvent extends NavEvent {}

// //
// class GoBackNavEvent extends NavEvent {}

// //
// abstract class NavState {}

// //
// class LoadingNavState extends NavState {}

// //
// class LoadedNavState extends NavState {
//   Post post;
//   LoadedNavState({required this.post});
// }

// //
// class FailToLoadNavState extends NavState {
//   Object err;
//   FailToLoadNavState({required this.err});
// }

// class NavBloc extends Bloc<NavEvent, NavState> {
//   final _dataService = DataService();
//   NavBloc() : super(LoadingNavState());

//   @override
//   Stream<NavState> mapEventToState(NavEvent event) async* {
//     if (event is LoadNavEvent) {
//       yield LoadingNavState();
//       try {
//         final posts = await _dataService.getPosts();
//         yield LoadedNavState(post: posts[0]);
//       } catch (e) {
//         yield FailToLoadNavState(err: e);
//       }
//     }
//   }
// }
