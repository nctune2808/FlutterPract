part of 'todo_cubit.dart';

@immutable
abstract class TodoState {}

class LoadingTodo extends TodoState {}

class ListTodoSuccess extends TodoState {
  final List<Todo> todos;
  ListTodoSuccess({
    required this.todos,
  });
}

class ListTodoFailure extends TodoState {
  final dynamic exception;
  ListTodoFailure({
    required this.exception,
  });
}
