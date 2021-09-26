import 'package:amplify_flutter/amplify.dart';
import 'package:todo_aws_cubit/models/Todo.dart';

class TodoRepository {
  Future<List<Todo>> getListTodo() async {
    try {
      final todos = await Amplify.DataStore.query(Todo.classType);
      return todos;
    } catch (e) {
      throw e;
    }
  }

  Future<void> createTodo(String title) async {
    final newTodo = Todo(title: title, isDone: false);
    try {
      return await Amplify.DataStore.save(newTodo);
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateTodo(Todo todo, bool isDone) async {
    final updatedTodo = todo.copyWith(isDone: isDone);
    try {
      await Amplify.DataStore.save(updatedTodo);
    } catch (e) {
      throw e;
    }
  }
}