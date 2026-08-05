import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class DraggableWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Draggable',
      markdownPath: 'assets/markdowns/widget_catalog/interactive/draggable_markdown.md',
      preview: _DraggableWidgetImplementation(),
    );
  }
}

class _DraggableWidgetImplementation extends StatefulWidget {
  @override
  __DraggableWidgetImplementationState createState() =>
      __DraggableWidgetImplementationState();
}

class __DraggableWidgetImplementationState
    extends State<_DraggableWidgetImplementation> {
  int _acceptedData = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Draggable<T> makes its child dragable, carrying a typed payload T (an int, a custom model) that a DragTarget<T> can accept. While the user drags, the `feedback` widget follows the finger and `childWhenDragging` replaces the original in place — useful for showing a "ghost" of the dragged item.',
            ),
            TextBlock(
              'The drag begins immediately by default; for a long-press trigger use LongPressDraggable instead. Keep feedback lightweight (it rebuilds as it moves) and remember the payload type must line up end-to-end — Draggable<int> only drops onto a DragTarget<int>.',
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
                    onAcceptWithDetails: (details) {
                      final int data = details.data as int;
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
