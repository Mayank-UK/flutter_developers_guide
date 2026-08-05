import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class RadioWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/radio_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Radio',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _RadioWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

enum SingingCharacter { lafayette, jefferson }

class _RadioWidgetImplementation extends StatefulWidget {
  @override
  __RadioWidgetImplementationState createState() =>
      __RadioWidgetImplementationState();
}

class __RadioWidgetImplementationState
    extends State<_RadioWidgetImplementation> {
  SingingCharacter _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Radio is a Material toggle that lets the user choose exactly one option from a mutually exclusive set. Every Radio in the group shares the same groupValue, and tapping one updates that shared value — the others automatically deselect.',
            ),
            TextBlock(
              'Use Radio (or RadioListTile) when the user must see all the options at once and pick exactly one. If the options are many or rarely changed, a dropdown is more compact; if there are only two or three, a segmented control or switch can read more cleanly.',
            ),
            TextBlock(
              'Tip: like Checkbox, the raw Radio renders only the circle. Wrap it in a RadioListTile to get the title, tap target, and accessibility wiring for free; in newer code prefer the Material 3 RadioListTile with adaptive styling.',
            ),
            Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: const Text('Lafayette'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.lafayette,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Thomas Jefferson'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.jefferson,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
