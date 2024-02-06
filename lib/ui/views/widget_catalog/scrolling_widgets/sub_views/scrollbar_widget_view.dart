import 'package:flutter/material.dart';

import '../../../../components/code_preview_component.dart';
import './../../../../components/section_wrapper_component_component.dart';
import './../../../../components/text_block_component.dart';

class ScrollbarWidgetView extends StatelessWidget {
  final String _appBarTitle = 'Scrollbar';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/scrolling/scrollbar_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabsComponent(
      appBarTitle: this._appBarTitle,
      previewTab: _ScrollbarWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _ScrollbarWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapperComponent(
          title: 'Simple use',
          content: [
            TextBlockComponent(
              '"Scrollbar" widget has named parameters isAlwaysShown, showTrackOnHover, etc, which specify the scrollbar behavior.',
            ),
            TextBlockComponent(
              'The scrollbar due to unknown reason is not visible when using "ListView.builder".',
            ),
            Container(
              height: 500,
              child: Scrollbar(
                thumbVisibility: true,
                child: ListView(
                  children: List.generate(
                    50,
                    (index) {
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.amber,
                        height: 50,
                        margin: const EdgeInsets.only(
                          bottom: 4,
                        ),
                      );
                    },
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
