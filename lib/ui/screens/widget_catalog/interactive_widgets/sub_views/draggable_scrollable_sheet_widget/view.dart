import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class DraggableScrollableSheetWidgetView extends StatelessWidget {
  final String _appBarTitle = 'DraggableScrollableSheet';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/interactive/draggable_scrollable_sheet_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _DraggableScrollableSheetWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _DraggableScrollableSheetWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
                '"DraggableScrollableSheet" widget has a named parameter builder, which takes a function and builds the layout of it\'s child.'),
            Container(
              height: 400,
              child: SizedBox.expand(
                child: DraggableScrollableSheet(
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(
                      color: Colors.amber,
                      child: ListView.builder(
                        shrinkWrap: true,
                        controller: scrollController,
                        itemCount: 25,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(title: Text('Item $index'));
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
