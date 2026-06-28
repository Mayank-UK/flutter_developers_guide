import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../../../domain/models/task.dart';
import 'view_model.dart';
import '../../../../../../components/markdown_preview.dart';

// exposing provider
class TodosAppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _HomeScreen();
  }
}

// main view
class _HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos app example'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => _AddTaskScreen(),
                ),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(text: 'All'),
            Tab(text: 'Incomplete'),
            Tab(text: 'Complete'),
            Tab(text: 'Code'),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          _AllTasksTab(),
          _IncompleteTasksTab(),
          _CompletedTasksTab(),
          _TodosCode(),
        ],
      ),
    );
  }
}

// todo item
class _TaskListItem extends StatelessWidget {
  final Task task;

  _TaskListItem({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: task.completed,
        onChanged: (bool? checked) {
          Provider.of<TodosViewModel>(context, listen: false).toggleTodo(task);
        },
      ),
      title: Text(task.title),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {
          Provider.of<TodosViewModel>(context, listen: false).deleteTodo(task);
        },
      ),
    );
  }
}

// todo list
class _TaskList extends StatelessWidget {
  final List<Task> tasks;

  _TaskList({required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getChildrenTasks(),
    );
  }

  List<Widget> getChildrenTasks() {
    return tasks.map((todo) => _TaskListItem(task: todo)).toList();
  }
}

// tab
class _AllTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<TodosViewModel>(
        builder: (context, todos, child) => _TaskList(
          tasks: todos.allTasks,
        ),
      ),
    );
  }
}

// tab
class _IncompleteTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<TodosViewModel>(
        builder: (context, todos, child) => _TaskList(
          tasks: todos.incompleteTasks,
        ),
      ),
    );
  }
}

// tab
class _CompletedTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<TodosViewModel>(
        builder: (context, todos, child) => _TaskList(
          tasks: todos.completedTasks,
        ),
      ),
    );
  }
}

class _TodosCode extends StatelessWidget {
  String _markdownLocation =
      'assets/markdowns/state_management/todos_markdown.md';

  @override
  Widget build(BuildContext context) {
    return MarkdownPreview(
      markdownLocation: this._markdownLocation,
    );
  }
}

// add task view
class _AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<_AddTaskScreen> {
  final taskTitleController = TextEditingController();
  bool completedStatus = false;

  @override
  void dispose() {
    taskTitleController.dispose();
    super.dispose();
  }

  void onAdd() {
    final String textVal = taskTitleController.text;
    final bool completed = completedStatus;
    if (textVal.isNotEmpty) {
      final Task todo = Task(
        title: textVal,
        completed: completed,
      );
      Provider.of<TodosViewModel>(context, listen: false).addTodo(todo);
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(controller: taskTitleController),
                  CheckboxListTile(
                    value: completedStatus,
                    onChanged: (checked) => setState(() {
                      completedStatus = checked!;
                    }),
                    title: const Text('Complete?'),
                  ),
                  ElevatedButton(
                    child: const Text('Add'),
                    onPressed: onAdd,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
