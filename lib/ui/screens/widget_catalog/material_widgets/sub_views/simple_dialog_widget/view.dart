import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SimpleDialogWidgetView extends StatelessWidget {
  final String _appBarTitle = 'SimpleDialog';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/simple_dialog_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      mobileUi: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _SimpleDialogWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _SimpleDialogWidgetImplementation extends StatelessWidget {
  void _showSimpleDialog(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (_) {
        return SimpleDialog(
          title: Text('The Title'),
          children: [
            SimpleDialogOption(
              child: Text('Option 1'),
              onPressed: () {
                // Do something
                print('You have selected the option 1');
                Navigator.of(ctx).pop();
              },
            ),
            SimpleDialogOption(
              child: Text('Option 2'),
              onPressed: () {
                // Do something
                print('You have selected the option 2');
                Navigator.of(ctx).pop();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"SimpleDialog" widget is shown using the "showDialog" function callback, which is in turn called inside a function/method',
            ),
            TextBlock(
              '"SimpleDialog" widget has children "SimpleDialogOption" which have named parameters onPressed and child to specify the behavior and content of the widget.',
            ),
            Container(
              child: ElevatedButton(
                onPressed: () => this._showSimpleDialog(context),
                child: Text(
                  'show simple dialog',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
