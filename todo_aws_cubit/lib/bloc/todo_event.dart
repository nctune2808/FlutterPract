part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class CreatTodoEvent extends TodoEvent {
  Todo todo;
  CreatTodoEvent({
    required this.todo,
  });
}

class DeleteTodoEvent extends TodoEvent {}

class UpdateTodoEvent extends TodoEvent {}
