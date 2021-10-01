import 'package:amplify_flutter/amplify.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_aws_cubit/data/todo_repository.dart';
import 'package:todo_aws_cubit/models/Todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final _todoRepo = TodoRepository.instance;
  TodoBloc() : super(TodoState());

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is CreatTodoEvent) {
      try {
        // await _todoRepo.createTodo(title, userId);
        await Amplify.DataStore.save(event.todo);
        yield state.copyWith(todo: event.todo);
      } catch (e) {
        yield ListTodoFailure(exception: e);
      }
    }
  }
}
