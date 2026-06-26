## view_model.dart

// Disposed automatically when the screen is no longer in the tree, don't use autoDispose in sharedViewModel
    class RiverpodTodoViewModel extends AutoDisposeNotifier<List<Todo>> {
        static const _uuid = Uuid();

        @override
        List<Todo> build() => [
                Todo(id: _uuid.v4(), title: 'Finish the app', isCompleted: false),
                Todo(id: _uuid.v4(), title: 'Write a blog post', isCompleted: false),
                Todo(id: _uuid.v4(), title: 'Share with community', isCompleted: true),
            ];

        void addTodo(String title, {bool isCompleted = false}) {
            final trimmed = title.trim();
            if (trimmed.isEmpty) return;

            state = [
                ...state,
                Todo(id: _uuid.v4(), title: trimmed, isCompleted: isCompleted),
            ];
        }

        void toggleTodo(Todo todo) {
            state = state.map((t) => t.id == todo.id ? t.copyWith(isCompleted: !t.isCompleted) : t).toList();
        }

        void deleteTodo(Todo todo) {
            state = state.where((t) => t.id != todo.id).toList();
        }
    }

    /* 
        In Provider, MultiProvider in main.dart is doing this registration work for you, invisibly:
            main.dart — you wrote this once and forgot about it
            ChangeNotifierProvider(create: (_) => TodosViewModel())

        In Riverpod, that registration lives next to the class itself instead of in main.dart like done below

        That's it. Same concept, different location.
    */
    final todosProvider = NotifierProvider.autoDispose<RiverpodTodoViewModel, List<Todo>>(
        RiverpodTodoViewModel.new,
    );

    /* 
        In Provider you had getters:
            UnmodifiableListView<Task> get incompleteTasks => ...
            UnmodifiableListView<Task> get completedTasks => ...

        In Riverpod, those same getters become separately registered providers so widgets can subscribe to them independently. 
        Same data, same logic — just registered so Riverpod can cache and track them.
    */
    final incompleteTodosProvider = Provider.autoDispose<List<Todo>>((ref) {
        return ref.watch(todosProvider).where((t) => !t.isCompleted).toList();
    });

    final completedTodosProvider = Provider.autoDispose<List<Todo>>((ref) {
        return ref.watch(todosProvider).where((t) => t.isCompleted).toList();
    });


## view.dart

    class RiverpodTodosScreen extends ConsumerStatefulWidget {
        const RiverpodTodosScreen({super.key});

        @override
        ConsumerState<RiverpodTodosScreen> createState() => _RiverpodTodosScreenState();
    }

        class _RiverpodTodosScreenState extends ConsumerState<RiverpodTodosScreen> with SingleTickerProviderStateMixin {
            late final TabController _tabController;

            @override
            void initState() {
                super.initState();
                _tabController = TabController(length: 3, vsync: this);
            }

            @override
            void dispose() {
                _tabController.dispose();
                super.dispose();
            }

            @override
            Widget build(BuildContext context) {
                return Scaffold(
                appBar: AppBar(
                    title: const Text('Todos — Riverpod'),
                    leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => context.pop(),
                    ),
                    actions: [
                    IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const _AddTodoScreen(),
                        ),
                        ),
                    ),
                    ],
                    bottom: TabBar(
                    controller: _tabController,
                    tabs: const [
                        Tab(text: 'All'),
                        Tab(text: 'Incomplete'),
                        Tab(text: 'Complete'),
                    ],
                    ),
                ),
                body: TabBarView(
                    controller: _tabController,
                    children: const [
                        _AllTodosTab(),
                        _IncompleteTodosTab(),
                        _CompletedTodosTab(),
                    ],
                ),
            );
        }
    }

    class _AllTodosTab extends ConsumerWidget {
        const _AllTodosTab();

        @override
        Widget build(BuildContext context, WidgetRef ref) {
            final todos = ref.watch(todosProvider);
            return _TodoList(todos: todos);
        }
    }

    class _IncompleteTodosTab extends ConsumerWidget {
        const _IncompleteTodosTab();

        @override
        Widget build(BuildContext context, WidgetRef ref) {
            final todos = ref.watch(incompleteTodosProvider);
            return _TodoList(todos: todos);
        }
    }

    class _CompletedTodosTab extends ConsumerWidget {
        const _CompletedTodosTab();

        @override
        Widget build(BuildContext context, WidgetRef ref) {
            final todos = ref.watch(completedTodosProvider);
            return _TodoList(todos: todos);
        }
    }

    class _TodoList extends StatelessWidget {
        const _TodoList({required this.todos});

        final List<Todo> todos;

        @override
        Widget build(BuildContext context) {
            if (todos.isEmpty) {
                return const Center(child: Text('No todos here.'));
            }

            return ListView.builder(
                itemCount: todos.length,
                itemBuilder: (_, index) => _TodoListItem(todo: todos[index]),
            );
        }
    }

    // Key rule: `ref.read` (not `ref.watch`) is used inside callbacks.
    // `ref.watch` belongs only in `build`.
    class _TodoListItem extends ConsumerWidget {
        const _TodoListItem({required this.todo});

        final Todo todo;

        @override
        Widget build(BuildContext context, WidgetRef ref) {
            return ListTile(
                leading: Checkbox(
                    value: todo.isCompleted,
                    onChanged: (_) {
                        // ref.read inside a callback — we want a one-shot action,
                        // not a subscription. ref.watch here would be a runtime error.
                        ref.read(todosProvider.notifier).toggleTodo(todo);
                    },
                ),
                title: Text(todo.title),
                trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                        ref.read(todosProvider.notifier).deleteTodo(todo);
                    },
                ),
            );
        }
    }

    class _AddTodoScreen extends ConsumerStatefulWidget {
        const _AddTodoScreen();

        @override
        ConsumerState<_AddTodoScreen> createState() => _AddTodoScreenState();
    }

    class _AddTodoScreenState extends ConsumerState<_AddTodoScreen> {
        final _titleController = TextEditingController();
        bool _isCompleted = false;

        @override
        void dispose() {
            _titleController.dispose();
            super.dispose();
        }

        void _onAdd() {
            final title = _titleController.text.trim();
            if (title.isEmpty) return;

            // ref.read — we're inside a callback, not build().
            ref.read(todosProvider.notifier).addTodo(title, isCompleted: _isCompleted);

            Navigator.pop(context);
        }

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(title: const Text('Add Task')),
                body: ListView(
                    padding: const EdgeInsets.all(15.0),
                    children: [
                        TextField(controller: _titleController),
                        CheckboxListTile(
                            value: _isCompleted,
                            onChanged: (checked) => setState(() {
                            _isCompleted = checked!;
                            }),
                            title: const Text('Complete?'),
                        ),
                        ElevatedButton(
                            onPressed: _onAdd,
                            child: const Text('Add'),
                        ),
                    ],
                ),
            );
        }
    }
