part of 'todo_bloc.dart';

class TodoState {
  Todo? todo;

  TodoState({
    this.todo,
  });

  TodoState copyWith({
    Todo? todo,
  }) {
    return TodoState(
      todo: todo ?? this.todo,
    );
  }
}

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
