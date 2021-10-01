import 'package:amplify_flutter/amplify.dart';
import 'package:todo_aws_cubit/models/Todo.dart';

class TodoRepository {
  TodoRepository._();
  static final TodoRepository instance = TodoRepository._();

  Future<List<Todo>> getListTodo(String userId) async {
    try {
      final todos = await Amplify.DataStore.query(Todo.classType,
          where: Todo.USERID.eq(userId));
      return todos;
    } catch (e) {
      throw e;
    }
  }

  Future<void> createTodo(String title, String userId) async {
    final newTodo = Todo(title: title, isDone: false, userId: userId);
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

  Future<void> deleteTodo(Todo todo) async {
    try {
      await Amplify.DataStore.delete(todo);
    } catch (e) {
      throw e;
    }
  }

  Stream observeTodos() {
    return Amplify.DataStore.observe(Todo.classType);
  }
}
