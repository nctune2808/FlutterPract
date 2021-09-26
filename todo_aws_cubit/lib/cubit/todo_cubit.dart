import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_aws_cubit/data/todo_repository.dart';
import 'package:todo_aws_cubit/models/Todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final _todoRepo = TodoRepository();
  TodoCubit() : super(LoadingTodo());

  void getListTodo() async {
    if (state is ListTodoSuccess == false) {
      emit(LoadingTodo());
    }

    try {
      final todos = await _todoRepo.getListTodo();
      emit(ListTodoSuccess(todos: todos));
    } catch (e) {
      emit(ListTodoFailure(exception: e));
    }
  }

  void createTodo(String title) async {
    await _todoRepo.createTodo(title);
    getListTodo();
  }

  void updateTodo(Todo todo, bool isDone) async {
    await _todoRepo.updateTodo(todo, isDone);
    getListTodo();
  }
}
