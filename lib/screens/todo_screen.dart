import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/providers/todo_provider.dart';

class TodoScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Todo App")),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: "Enter Todo"),
          ),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.trim().isNotEmpty) {
                todoProvider.addTodo(_controller.text);
                _controller.clear();
              }
            },
            child: Text("Add Todo"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoProvider.todos.length,
              itemBuilder: (context, index) {
                final todo = todoProvider.todos[index];
                return ListTile(
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration:
                          todo.isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  trailing: Wrap(
                    spacing: 12,
                    children: [
                      IconButton(
                        onPressed: () => todoProvider.toggleTodo(index),
                        icon: Icon(
                          todo.isDone
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: todo.isDone ? Colors.green : Colors.grey,
                        ),
                        tooltip: 'Mark as done',
                      ),
                      IconButton(
                        onPressed: () => todoProvider.deleteTodo(index),
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
