import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SimpleDialogWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'SimpleDialog',
      markdownPath: 'assets/markdowns/widget_catalog/material/simple_dialog_markdown.md',
      preview: _SimpleDialogWidgetImplementation(),
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
                ctx.pop();
              },
            ),
            SimpleDialogOption(
              child: Text('Option 2'),
              onPressed: () {
                // Do something
                print('You have selected the option 2');
                ctx.pop();
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
              'SimpleDialog is a Material dialog that offers the user a list of simple, self-explanatory options (no per-option text body). It is the right choice when the question is a clean "pick one of these" — choose an account, choose a sort order — where AlertDialog\'s title+content+button layout would feel heavyweight.',
            ),
            TextBlock(
              'It is pushed via showDialog and built from a title plus a list of SimpleDialogOption children. Each SimpleDialogOption has its own onPressed, which typically does the work and then closes the dialog by popping the Navigator.',
            ),
            TextBlock(
              'Tip: if the options need long descriptions or icons, build a custom Dialog with a Column of ListTile rows instead — SimpleDialogOption is intentionally minimal and does not lay out leading/trailing widgets for you.',
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
