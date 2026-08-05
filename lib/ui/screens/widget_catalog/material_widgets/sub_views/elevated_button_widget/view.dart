import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ElevatedButtonWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'ElevatedButton',
      markdownPath: 'assets/markdowns/widget_catalog/material/elevated_button_markdown.md',
      preview: _ElevatedButtonWidgetImplementation(),
    );
  }
}

class _ElevatedButtonWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'ElevatedButton is the filled, elevated Material button used for the primary action on a screen — "Save", "Submit", "Continue". Its raised appearance signals prominence and draws the eye to the most important next step.',
            ),
            TextBlock(
              'It is constructed with an onPressed callback (pass null to disable the button) and a child widget, almost always Text or a Row with an icon plus a label. The button styles itself from ElevatedButtonTheme, so all elevated buttons across the app stay consistent.',
            ),
            TextBlock(
              'Tip: do not place several ElevatedButtons side-by-side — that fights their "I am the primary action" intent. Use a single filled button for the primary action and TextButton or OutlinedButton for secondary alternatives.',
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Button'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
