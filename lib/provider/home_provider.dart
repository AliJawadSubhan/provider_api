import 'package:flutter/material.dart';
import 'package:provider_api_calllllllllllll/model/todo_model.dart';
import 'package:provider_api_calllllllllllll/services/todo_service.dart';

class TodoProvider extends ChangeNotifier {
  final service = TodoService();
  bool isLoading = false;
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  Future getAllTodosFromService() async {
    isLoading = true;
    notifyListeners();
    final response = await service.getAllTodos();
    _todos = response;
    isLoading = false;
    notifyListeners();
  }
}
