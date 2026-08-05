import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class TextButtonWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'TextButton',
      markdownPath: 'assets/markdowns/widget_catalog/material/text_button_markdown.md',
      preview: _TextButtonWidgetImplementation(),
    );
  }
}

class _TextButtonWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'TextButton is the flattest Material button — text with no border and no fill, responding to a tap with an ink splash only. Use it for low-emphasis actions: "Cancel", "Skip", "Learn more", or as the action inside dialogs, cards, and snackbars where a heavy button would shout too loud.',
            ),
            TextBlock(
              'It is the renamed successor to the deprecated FlatButton, and the third step in the Material button hierarchy below ElevatedButton and OutlinedButton. As with the other buttons, set onPressed to null to disable rather than wrapping in an IgnorePointer.',
            ),
            TextBlock(
              'Tip: TextButton is also how you build the action widgets inside an AlertDialog (actions:) or a SnackBar (action:), so its look stays consistent across all of Material\'s transient surfaces.',
            ),
            Container(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Button',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
