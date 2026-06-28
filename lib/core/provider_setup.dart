import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../ui/screens/state_management/sub_views/provider_state_management/sub_screens/todo_app/view_model.dart';

// provider is only used to add provider state management example

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => TodosViewModel()),
];
