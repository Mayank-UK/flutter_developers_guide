import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class BackdropFilterWidgetView extends StatelessWidget {
  final String _appBarTitle = 'BackdropFilter';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/painting_effects/backdrop_filter_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _BackdropFilterWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _BackdropFilterWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"BackdropFilter" widget has named parameter filter, which specifies the widget behavior.',
            ),
            Container(
              height: 200,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Text('0' * 10000),
                  Center(
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ui.ImageFilter.blur(
                          sigmaX: 5.0,
                          sigmaY: 5.0,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: 100.0,
                          height: 100.0,
                          child: Text('Hello World'),
                        ),
                      ),
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
