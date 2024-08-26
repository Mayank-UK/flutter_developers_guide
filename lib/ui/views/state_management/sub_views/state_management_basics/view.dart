import 'package:flutter/material.dart';

import '../../../../components/code_preview_tabs.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/content_group_wrapper.dart';
import '../../../../components/text_block.dart';

class StateManagementBasicsView extends StatelessWidget {
  final String _appBarTitle = 'State management basics';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/state_management/state_management_basics_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _ColorsImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _ColorsImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Stateful widgets',
          content: [
            TextBlock(
              'Though widgets are unchangeable but widget’s state are changeable, these types of widget are called Stateful widget, and whenever the state of widget changes, the widget gets rendered again with the new state. So changing the widget’s state is indirectly same as changing the widget dynamically.',
            ),
            ContentGroupWrapper(
              title: 'setState()',
              content: [
                TextBlock(
                  'Whenever there is some change occurs in the state, we call setState() method, available inside the Stateful widget. Calling setState tells the Framework that the widget’s state is updated, and the widget should be rebuilt, hence it is rebuilt with the new state.',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
