import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/code_preview_tabs.dart';
import 'package:flutter_developers_guide/ui/components/content_group_wrapper.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/section_wrapper.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';

class NavigationRoutingView extends StatelessWidget {
  final String _appBarTitle = 'Imperative routing';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/navigation_routing/imperative_approach_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _ImperativeRoutingImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ImperativeRoutingImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Navigator ',
          content: [
            TextBlock(
              'A widget that manages a set of child widgets with a stack discipline.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'Using the Navigator API',
          content: [
            TextBlock(
              'Mobile apps typically reveal their contents via full-screen elements called "screens" or "pages". In Flutter these elements are called routes and they\'re managed by a Navigator widget.',
            ),
            TextBlock(
              'The navigator manages a stack of Route objects and provides two ways for managing the stack, the declarative API Navigator.pages or imperative API Navigator.push and Navigator.pop.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'Displaying a full-screen route',
          content: [
            TextBlock(
              'Although you can create a navigator directly, it\'s most common to use the navigator created by the Router which itself is created and configured by a WidgetsApp or a MaterialApp widget. You can refer to that navigator with Navigator.of.',
            ),
            TextBlock(
              'A MaterialApp is the simplest way to set things up. The MaterialApp\'s home becomes the route at the bottom of the Navigator\'s stack. It is what you see when the app is launched.',
            ),
            TextBlock(
              'To push a new route on the stack you can create an instance of MaterialPageRoute with a builder function that creates whatever you want to appear on the screen.',
            ),
            TextBlock(
              'The route defines its widget with a builder function instead of a child widget because it will be built and rebuilt in different contexts depending on when it\'s pushed and popped.',
            ),
            TextBlock(
              'Scaffold automatically adds a "back" button to its AppBar. Pressing the back button causes Navigator.pop to be called. On Android, pressing the system back button does the same thing.',
            ),
            TextBlock(
              'Routes can return a value.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'Using named routes',
          content: [
            TextBlock(
              'Mobile apps often manage a large number of routes and it\'s often easiest to refer to them by name. Route names, by convention, use a path-like structure (for example, "/a/b/c"). The app\'s home page route is named "/" by default.',
            ),
            TextBlock(
              'The MaterialApp uses onGenerateRoute callback to generate all routes.',
            ),
            ContentGroupWrapper(
              title: 'Passing arguments between views',
              content: [
                TextBlock(
                  '1) Create a class whose object will be passed.',
                ),
                TextBlock(
                  '2) Pass the object to the named parameter "arguments" of "Navigator".',
                ),
                TextBlock(
                  '3) Access the passed arguments by casting the "settings.arguments" to the class definition inside "generateRoute".',
                ),
                TextBlock(
                  '4) Pass the arguments to the view using it\'s named parameters.',
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
