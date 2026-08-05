import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class DraggableScrollableSheetWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/interactive/draggable_scrollable_sheet_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'DraggableScrollableSheet',
      mobileUi: [
        CodePreviewTabs(
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
                'DraggableScrollableSheet is a bottom-sheet that grows and shrinks in response to drag gestures: dragging up resizes it until its max size, then the inner content starts scrolling; dragging back down collapses it again. It\'s the "bottom sheet that becomes a full page" pattern used for music players, maps, and filters.'),
            TextBlock(
              'The builder hands you a ScrollController — wire it into the ListView/GridView inside the sheet so the gesture correctly transitions between resizing and scrolling. Control the size stops with snapSizes and initialChildSize/min/maxChildSize, and typically show it via showModalBottomSheet with isScrollControled: true.',
            ),
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
