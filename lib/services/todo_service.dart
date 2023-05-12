import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider_api_calllllllllllll/model/todo_model.dart';

class TodoService {
  Future<List<Todo>> getAllTodos() async {
    List<Todo> todos = [];
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/todos");
    final response = await http.get(url);
    //  response.body;
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      for (var todo in jsonData) {
        var todoData = Todo.fromJson(todo);
        todos.add(todoData);
      }
      return todos;
    } else {
      return [];
    }
  }
}
