import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class DecoratedBoxWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/painting_effects/decorated_box_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'DecoratedBox',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _DecoratedBoxWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _DecoratedBoxWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"DecoratedBox" widget has named parameter decoration, which specifies the widget\'s UI.',
            ),
            Container(
              child: DecoratedBox(
                position: DecorationPosition.background,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  border: Border.all(
                    color: const Color(0xFF000000),
                    style: BorderStyle.solid,
                    width: 4.0,
                  ),
                  borderRadius: BorderRadius.zero,
                  shape: BoxShape.rectangle,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Color(0x66000000),
                      blurRadius: 10.0,
                      spreadRadius: 4.0,
                    )
                  ],
                ),
                child: Container(
                  child: Container(
                    width: 100,
                    height: 100,
                    padding: EdgeInsets.all(20),
                    child: FlutterLogo(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
