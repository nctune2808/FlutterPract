import 'package:flutter_bloc/flutter_bloc.dart';

import 'data_service.dart';
import 'post.dart';

class PostsCubit extends Cubit<List<Post>> {
  // declare networking request or repository
  final _dataService = DataService();

  PostsCubit() : super([]);

  void getPosts() async => emit(await _dataService.getPosts());
}
