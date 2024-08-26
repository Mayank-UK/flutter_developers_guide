import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class DragTargetWidgetView extends StatelessWidget {
  final String _appBarTitle = 'DragTarget';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/interactive/drag_target_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _DragTargetWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _DragTargetWidgetImplementation extends StatefulWidget {
  @override
  __DragTargetWidgetImplementationState createState() =>
      __DragTargetWidgetImplementationState();
}

class __DragTargetWidgetImplementationState
    extends State<_DragTargetWidgetImplementation> {
  int _acceptedData = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"DragTarget" widget is used mostly with "Draggable" widget.',
            ),
            TextBlock(
              'It has named parameters like builder, onAccept, which specify it\'s behavior and layout.',
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Draggable<int>(
                    data: 10,
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      color: Colors.amber,
                      child: Center(
                        child: Text("Draggable"),
                      ),
                    ),
                    feedback: Container(
                      color: Colors.deepOrange,
                      height: 100,
                      width: 100,
                      child: Icon(Icons.directions_run),
                    ),
                    childWhenDragging: Container(
                      height: 100.0,
                      width: 100.0,
                      color: Colors.pinkAccent,
                      child: Center(
                        child: Text("Child When Dragging"),
                      ),
                    ),
                  ),
                  DragTarget(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return Container(
                        color: Colors.red,
                        height: 100.0,
                        padding: const EdgeInsets.all(8),
                        width: 100.0,
                        child: Center(
                          child: Text(
                              "Value is updated to: ${this._acceptedData}"),
                        ),
                      );
                    },
                    onAccept: (int data) {
                      setState(() {
                        this._acceptedData += data;
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
