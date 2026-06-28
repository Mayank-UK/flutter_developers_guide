import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_developers_guide/ui/blocs/todos/todos_bloc.dart';
import 'package:flutter_developers_guide/ui/components/code_preview_tabs.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:get_it/get_it.dart';

class FirebaseFirestoreView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/third_party_services/firebase.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Firebase Database',
      mobileUi: [
        CodePreviewTabs(
          previewTab: BlocProvider(
            create: (_) => GetIt.I<TodosBloc>()..add(WatchTodos()),
            child: const _FirebaseFirestoreImplementation(),
          ),
          codeTabMarkdownLocation: _codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _FirebaseFirestoreImplementation extends StatelessWidget {
  const _FirebaseFirestoreImplementation();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        children: [
          const _AddTodoBar(),
          Expanded(child: _TodoList()),
        ],
      ),
    );
  }
}

class _AddTodoBar extends StatefulWidget {
  const _AddTodoBar();

  @override
  State<_AddTodoBar> createState() => _AddTodoBarState();
}

class _AddTodoBarState extends State<_AddTodoBar> {
  final _controller = TextEditingController();

  void _submit() {
    final title = _controller.text.trim();
    if (title.isEmpty) return;
    context.read<TodosBloc>().add(AddTodo(title));
    _controller.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Add a todo...',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _submit(),
            ),
          ),
          const SizedBox(width: 8),
          IconButton.filled(
            onPressed: _submit,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class _TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) => switch (state) {
        TodosInitial() ||
        TodosLoading() =>
          const Center(child: CircularProgressIndicator()),
        TodosLoaded(todos: final todos) when todos.isEmpty =>
          const Center(child: Text('No todos yet. Add one above!')),
        TodosLoaded(todos: final todos) => ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) => _TodoTile(todo: todos[index]),
          ),
        TodosError(failure: final failure) =>
          Center(child: Text('Error: ${failure.message}')),
      },
    );
  }
}

class _TodoTile extends StatelessWidget {
  final todo;

  const _TodoTile({required this.todo});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TodosBloc>();
    return ListTile(
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (val) => bloc.add(ToggleTodo(todo.id, val ?? false)),
      ),
      title: Text(
        todo.title,
        style: todo.isCompleted
            ? const TextStyle(decoration: TextDecoration.lineThrough)
            : null,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: () => bloc.add(DeleteTodo(todo.id)),
      ),
    );
  }
}
