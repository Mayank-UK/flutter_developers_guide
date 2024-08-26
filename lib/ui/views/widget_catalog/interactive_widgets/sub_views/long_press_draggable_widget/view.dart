import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class LongPressDraggableWidgetView extends StatelessWidget {
  final String _appBarTitle = 'LongPressDraggable';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/interactive/long_press_draggable_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _LongPressDraggableWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _LongPressDraggableWidgetImplementation extends StatefulWidget {
  @override
  __LongPressDraggableWidgetImplementationState createState() =>
      __LongPressDraggableWidgetImplementationState();
}

class __LongPressDraggableWidgetImplementationState
    extends State<_LongPressDraggableWidgetImplementation> {
  int acceptedData = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(''),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  LongPressDraggable<int>(
                    data: 10,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.amber,
                      height: 100.0,
                      padding: const EdgeInsets.all(8),
                      width: 100.0,
                      child: Text("Long press draggable"),
                    ),
                    feedback: Container(
                      color: Colors.deepOrange,
                      height: 100,
                      padding: const EdgeInsets.all(8),
                      width: 100,
                      child: Icon(Icons.directions_run),
                    ),
                    childWhenDragging: Container(
                      alignment: Alignment.center,
                      color: Colors.pinkAccent,
                      height: 100.0,
                      padding: const EdgeInsets.all(8),
                      width: 100.0,
                      child: Text("Child When Dragging"),
                    ),
                  ),
                  DragTarget(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.red,
                        height: 100.0,
                        padding: const EdgeInsets.all(8),
                        width: 100.0,
                        child: Text(
                          "Value is updated to: $acceptedData",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                    onAccept: (int data) {
                      setState(() {
                        acceptedData += data;
                      });
                    },
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
