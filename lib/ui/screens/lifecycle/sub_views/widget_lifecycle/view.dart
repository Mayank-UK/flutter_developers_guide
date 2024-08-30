import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';

import '../../../../components/code_preview_tabs.dart';
import '../../../../components/section_wrapper.dart';

class WidgetLifecycleView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/lifecycle/widget_lifecycle_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Widget lifecycle',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _WidgetLifecycleImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _WidgetLifecycleImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'General information',
          content: [
            TextBlock(
              'Only stateful widgets can have lifecycle methods exception being build method that is available to stateless widgets too.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'createState()',
          content: [
            TextBlock(
              'When the Framework is instructed to build a StatefulWidget, it immediately calls createState().',
            ),
          ],
        ),
        SectionWrapper(
          title: 'initState()',
          content: [
            TextBlock(
              'This is the first method called when the widget is created (after the class constructor, of course.) initState is called once and only once. It must call super.initState().',
            ),
          ],
        ),
        SectionWrapper(
          title: 'didChangeDependencies()',
          content: [
            TextBlock(
              'This method is called immediately after initState on the first time the widget is built.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'build()',
          content: [
            TextBlock(
              'This method is called often. It is required, and it must return a Widget.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'didUpdateWidget()',
          content: [
            TextBlock(
              ' If the parent widget changes and has to rebuild this widget (because it needs to give it different data), but it\'s being rebuilt with the same runtimeType, then this method is called. This is because Flutter is re-using the state, which is long lived. In this case, you may want to initialize some data again, as you would in initState.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'setState()',
          content: [
            TextBlock(
              'This method is called often from the framework itself and from the developer. Its used to notify the framework that data has changed.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'deactivate()',
          content: [
            TextBlock(
              'Deactivate is called when State is removed from the tree, but it might be reinserted before the current frame change is finished. This method exists basically because State objects can be moved from one point in a tree to another.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'dispose()',
          content: [
            TextBlock(
              'dispose() is called when the State object is removed, which is permanent. This method is where you should unsubscribe and cancel all animations, streams, etc.',
            ),
          ],
        ),
      ],
    );
  }
}
