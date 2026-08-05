import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SwitchWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Switch',
      markdownPath: 'assets/markdowns/widget_catalog/material/switch_markdown.md',
      preview: _SwitchWidgetImplementation(),
    );
  }
}

class _SwitchWidgetImplementation extends StatefulWidget {
  @override
  __SwitchWidgetImplementationState createState() =>
      __SwitchWidgetImplementationState();
}

class __SwitchWidgetImplementationState
    extends State<_SwitchWidgetImplementation> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Switch is a Material toggle that flips a single setting between on and off. It is the right control for binary preferences ("Airplane mode", "Notifications") that take effect immediately, with no need to press a Save button.',
            ),
            TextBlock(
              'Like Checkbox and Radio, the widget is fully controlled: you store the bool value and update it from onChanged. Pass null for onChanged to disable the switch, and wrap with SwitchListTile when you want a label, tap target, and accessible row layout.',
            ),
            TextBlock(
              'Tip: prefer Switch over Checkbox for a single binary setting. Checkbox implies "yes/no within a group of options", while Switch implies "this one thing is on or off" — matching that convention makes your UI feel native.',
            ),
            Container(
              child: Switch(
                value: status,
                onChanged: (value) {
                  print("VALUE : $value");
                  setState(() {
                    status = value;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
