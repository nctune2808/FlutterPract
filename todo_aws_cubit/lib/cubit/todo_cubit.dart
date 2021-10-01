import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:todo_aws_cubit/data/todo_repository.dart';
import 'package:todo_aws_cubit/models/Todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final _todoRepo = TodoRepository.instance;
  final String userId;

  TodoCubit({
    required this.userId,
  }) : super(LoadingTodo());

  void getListTodo() async {
    if (state is ListTodoSuccess == false) {
      emit(LoadingTodo());
    }

    try {
      final todos = await _todoRepo.getListTodo(userId);
      emit(ListTodoSuccess(todos: todos));
    } catch (e) {
      emit(ListTodoFailure(exception: e));
    }
  }

  void observeTodo() {
    final todoStream = _todoRepo.observeTodos();
    todoStream.listen((_) => getListTodo());
  }

  void createTodo(String title) async {
    await _todoRepo.createTodo(title, userId);
  }

  void updateTodo(Todo todo, bool isDone) async {
    await _todoRepo.updateTodo(todo, isDone);
  }

  void deleteTodo(Todo todo) async {
    await _todoRepo.deleteTodo(todo);
  }
}
