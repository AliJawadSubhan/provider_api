import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_calllllllllllll/provider/home_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false)
          .getAllTodosFromService();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TodoProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return CircularProgressIndicator();
          }
          return ListView.builder(
            itemCount: provider.todos.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: LinearGradient(
                      colors: [Colors.purple, Colors.blue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 3.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      child: Text(
                        provider.todos[index].id.toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    title: Text(
                      provider.todos[index].title.toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: provider.todos[index].completed == true
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                    trailing: Checkbox(
                      value: provider.todos[index].completed,
                      onChanged: (value) {
                        // Implement your logic here for handling checkbox changes
                      },
                    ),
                    tileColor: Colors.transparent,
                    textColor: Colors.white,
                    iconColor: Colors.white,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
