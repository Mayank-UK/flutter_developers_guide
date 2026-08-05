import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class CupertinoSwitchWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/cupertino/cupertino_switch_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'CupertinoSwitch',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _CupertinoSwitchWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _CupertinoSwitchWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'CupertinoSwitch is the iOS-style toggle for a single on/off setting. Pass value (bool) and onChanged; the thumb slides along the track with the native iOS spring, and the track picks up the system tint color.',
            ),
            TextBlock(
              'Use it for boolean preferences, not for choosing among several options (a segmented control is the right tool for that). When onChanged is null the switch shows disabled styling and stays read-only.',
            ),
          ],
        ),
      ],
    );
  }
}
