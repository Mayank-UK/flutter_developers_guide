import 'package:flutter/material.dart';

import '../../../../components/code_preview_component.dart';
import '../../../../components/section_wrapper_component_component.dart';

class ClickBehaviorView extends StatelessWidget {
  final String _appBarTitle = 'Click/tap behavior';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui_manipulation/interactive_behaviours/click_behavior_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabsComponent(
      appBarTitle: this._appBarTitle,
      previewTab: _ClickBehaviorImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _ClickBehaviorImplementation extends StatelessWidget {
  void onTap(BuildContext context) {
    final SnackBar snackBar =
        SnackBar(content: const Text('Click/tap registered'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapperComponent(
          title: 'Using "InkWell" widget',
          content: [
            Container(
              child: Text(
                  '"InkWell" widget can be used to attach a click event on any widget, it has a named parameter "onTap", which takes a function or method for executing when a click/tap is detected.'),
            ),
            InkWell(
              onTap: () => onTap(context),
              child: Container(
                alignment: Alignment.center,
                color: Colors.amber,
                height: 50,
                width: 50,
                child: const Text('Click'),
              ),
            ),
          ],
        ),
        SectionWrapperComponent(
          title: 'Using "GestureDetector" widget',
          content: [
            Container(
              child: Text(
                  '"GestureDetector" widget can be used to attach a click event on any widget, it has a named parameter "onTap", which takes a function or method for executing when a click/tap is detected.'),
            ),
            GestureDetector(
              onTap: () => onTap(context),
              child: Container(
                alignment: Alignment.center,
                color: Colors.amber,
                height: 50,
                width: 50,
                child: const Text('Click'),
              ),
            ),
          ],
        ),
        SectionWrapperComponent(
          title: 'Using different button widgets',
          content: [
            Container(
              child: Text(
                  'All the button widgets have a named parameter "onPressed", which takes a function as a value for execution.'),
            ),
            Wrap(
              direction: Axis.horizontal,
              runSpacing: 8,
              spacing: 8,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => onTap(context),
                  child: const Text('Click'),
                ),
                FloatingActionButton(
                  onPressed: () => onTap(context),
                  child: const Text('Click'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
