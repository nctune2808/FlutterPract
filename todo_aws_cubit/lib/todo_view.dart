import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_aws_cubit/cubit/auth_cubit.dart';
import 'package:todo_aws_cubit/cubit/todo_cubit.dart';
import 'package:todo_aws_cubit/loading_view.dart';

import 'models/Todo.dart';

class TodosView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _navBar(),
      floatingActionButton: _floatingActionButton(),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is ListTodoSuccess) {
            return state.todos.isEmpty
                ? _emptyTodosView()
                : _todoListView(state.todos);
          } else if (state is ListTodoFailure) {
            return _exceptionView(state.exception);
          } else {
            return LoadingView();
          }
        },
      ),
    );
  }

  AppBar _navBar() {
    return AppBar(
      title: Text('Todos'),
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          size: 30,
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.logout,
            size: 30,
          ),
          onPressed: () {
            BlocProvider.of<AuthCubit>(context).signOut();
          },
        ),
      ],
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => _newTodoView());
        });
  }

  Widget _emptyTodosView() {
    return Center(
      child: Text('No todos yet'),
    );
  }

  Widget _exceptionView(Exception exception) {
    return Center(
      child: Text(exception.toString()),
    );
  }

  Widget _todoListView(List<Todo> todos) {
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return Card(
            child: CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (newVal) {
                BlocProvider.of<TodoCubit>(context).updateTodo(todo, newVal!);
              },
              value: todo.isDone,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(todo.title.toString()),
                  IconButton(
                    icon: new Icon(Icons.delete),
                    onPressed: () {
                      BlocProvider.of<TodoCubit>(context).deleteTodo(todo);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _newTodoView() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(hintText: "Enter todo title"),
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<TodoCubit>(context)
                  .createTodo(_titleController.text);
              _titleController.text = '';
              Navigator.of(context).pop();
            },
            child: Text("Save new"),
          )
        ],
      ),
    );
  }
}
