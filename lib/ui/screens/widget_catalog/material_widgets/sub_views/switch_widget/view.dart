import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SwitchWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/switch_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Switch',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _SwitchWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
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
              '"Switch" widget has named parameters value and onChanged, which specifies the widget behavior and content.',
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
