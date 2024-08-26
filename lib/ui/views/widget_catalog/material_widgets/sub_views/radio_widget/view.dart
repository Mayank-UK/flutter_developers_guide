import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class RadioWidgetView extends StatelessWidget {
  final String _appBarTitle = 'Radio';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/radio_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _RadioWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
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
              '"Radio" widget has named parameters onChanged, groupValue, and value which specify the widget\'s behavior.',
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
