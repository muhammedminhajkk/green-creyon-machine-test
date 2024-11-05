import 'package:flutter/material.dart';
import 'package:green_craeon_machine_test/Todo/todomodel.dart';
import 'package:green_craeon_machine_test/storage/getstorage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TodoStorageService _storageService = TodoStorageService();
  List<TodoModel> todos = [];
  double? temperature;
  final String apiKey = 'a98a36694bb14bf8b0750605240511';

  @override
  void initState() {
    super.initState();
    todos = _storageService.loadTodos();

  }

  
  

  

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
     
      body: todos.isNotEmpty
          ? Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 24.0, right: 24, bottom: 10),
                    child: Card(
                      elevation: 4,
                      child: ListTile(
                        title: Text(todos[index].todo),
                        trailing: Checkbox(
                          value: todos[index].isCompleted,
                          onChanged: (value) {
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : const Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: Center(
                    child: Text(
                  'Press the Add Button To Add',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTodo = await showAlertDialog(context);
          if (newTodo != null) {
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Future<TodoModel?> showAlertDialog(BuildContext context) async {
  TextEditingController todoController = TextEditingController();

  return showDialog<TodoModel>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Add Todo'),
        content: TextField(
          controller: todoController,
          decoration: const InputDecoration(hintText: 'Enter todo item'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss the dialog without adding
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final todoText = todoController.text;
              if (todoText.isNotEmpty) {
                Navigator.of(context).pop(TodoModel(todo: todoText));
              }
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
