import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../ui/state_management/providers/todo_provider.dart';

// provider is only used to add provider state management example

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => TodosProvider()),
];
