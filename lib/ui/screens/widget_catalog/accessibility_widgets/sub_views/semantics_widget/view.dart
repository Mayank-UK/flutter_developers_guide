import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SemanticsWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/accessibility/semantics_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Semantics',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _SemanticsWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _SemanticsWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
                'Semantics annotates a widget subtree with a description of what it means, which the platform\'s accessibility tooling (TalkBack, VoiceOver) and search engines read instead of the raw pixels. Provide a label, a hint, and role flags like button or image for widgets that don\'t have an inherent meaning — an icon-only button, a decorative image, a custom-drawn control.'),
            TextBlock(
              'Set the properties that match what the user perceives: image: true plus a label for pictures, button: true plus an onTap for tappable areas. When you only need to suppress or merge, ExcludeSemantics and MergeSemantics are simpler, purpose-built wrappers.',
            ),
            Container(
              child: Semantics(
                image: true,
                label: 'profile picture',
                child: Image(
                  height: 64,
                  width: 64,
                  image: AssetImage('assets/images/demo.jpeg'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
