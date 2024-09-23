import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todo List",
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeActivityState();
  }
}

class HomeActivityState extends State<HomeActivity> {
  List<Map<String, dynamic>> task = [
    {"id": 1, "name": "Task 1", "isDone": false},
    {"id": 2, "name": "Task 2", "isDone": false},
    {"id": 3, "name": "Task 3", "isDone": false},
  ];

  List<Map<String, dynamic>> filteredTasks = [];
  TextEditingController myController = TextEditingController();
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredTasks = task; // Initialize filteredTasks with all tasks
  }

  void addTask(String title) {
    setState(() {
      task.add({"id": task.length + 1, "name": title, "isDone": false});
      filteredTasks = task; // Update filteredTasks to include new task
    });
    myController.clear();
  }

  void toggleTask(int id) {
    setState(() {
      final tasks = task.firstWhere((task) => task["id"] == id);
      tasks['isDone'] = !tasks['isDone'];
    });
  }

  void deleteTask(int id) {
    setState(() {
      task.removeWhere((task) => task['id'] == id);
      filteredTasks = task; // Update filteredTasks after deletion
    });
  }

  void searchTask(String query) {
    setState(() {
      filteredTasks = task
          .where((task) => task['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                label: Text("Search Todo"),
              ),
              onChanged: searchTask,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTasks.length,
              itemBuilder: (context, index) {
                final tasks = filteredTasks[index];
                return ListTile(
                  leading: Checkbox(
                    value: tasks['isDone'],
                    onChanged: (value) {
                      toggleTask(tasks['id']);
                    },
                  ),
                  title: Text(
                    tasks['name'],
                    style: TextStyle(
                      fontSize: 20,
                      decoration: tasks['isDone'] ? TextDecoration.lineThrough : TextDecoration.none,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      deleteTask(tasks['id']);
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: myController,
                    decoration: InputDecoration(
                      label: Text("Add Todo"),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (myController.text.isNotEmpty) {
                      addTask(myController.text);
                    }
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
