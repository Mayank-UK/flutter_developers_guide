import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ReorderableListViewWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/scrolling/reorderable_list_view_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'ReorderableListView',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _ReorderableListViewWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ReorderableListViewWidgetImplementation extends StatefulWidget {
  @override
  __ReorderableListViewWidgetImplementationState createState() =>
      __ReorderableListViewWidgetImplementationState();
}

class __ReorderableListViewWidgetImplementationState
    extends State<_ReorderableListViewWidgetImplementation> {
  final List<int> _items = List<int>.generate(50, (int index) => index);

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final int item = _items.removeAt(oldIndex);
      _items.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'ReorderableListView is a ListView whose items the user can drag to reorder. Supply onReorder(oldIndex, newIndex) to mutate your list when a drag finishes; Flutter handles the drag handle, drop indicator, and animation for you.',
            ),
            TextBlock(
              'Each child must have a stable Key so the framework can track items across positions as they\'re reordered. Remember Flutter\'s quirk: when dragging down, newIndex is already one past the dragged item, so decrement newIndex when oldIndex < newIndex before splicing.',
            ),
            Container(
              height: 500,
              child: ReorderableListView(
                onReorder: (int oldIndex, int newIndex) => _onReorder,
                children: List.generate(
                  _items.length,
                  (index) {
                    return Container(
                      key: Key('$index'),
                      margin: const EdgeInsets.only(
                        bottom: 8,
                      ),
                      child: ListTile(
                        tileColor: Colors.amber,
                        title: Text('Item ${_items[index]}'),
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
