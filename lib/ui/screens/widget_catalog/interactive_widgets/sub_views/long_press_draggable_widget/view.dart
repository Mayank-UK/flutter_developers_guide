import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class LongPressDraggableWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'LongPressDraggable',
      markdownPath: 'assets/markdowns/widget_catalog/interactive/long_press_draggable_markdown.md',
      preview: _LongPressDraggableWidgetImplementation(),
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
            TextBlock(
              'LongPressDraggable is a Draggable that begins the drag after a long-press instead of immediately, matching the platform convention for "press, hold, then drag" gestures. Use it when a plain drag would conflict with taps or scrolling — list reordering, icon long-press to pick up, drag-from-toolbar.',
            ),
            TextBlock(
              'It takes the same data, child, feedback, and childWhenDragging parameters as Draggable; only the gesture recognizer differs. Tune the long-press threshold via delay if you need a faster or more deliberate hold before the drag starts.',
            ),
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
                    onAcceptWithDetails: (details) {
                      final int data = details.data as int;
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
