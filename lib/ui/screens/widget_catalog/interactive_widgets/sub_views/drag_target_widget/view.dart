import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class DragTargetWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'DragTarget',
      markdownPath: 'assets/markdowns/widget_catalog/interactive/drag_target_markdown.md',
      preview: _DragTargetWidgetImplementation(),
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
              'DragTarget is the receiving end of a drag-and-drop: while a Draggable is dragged over it, the builder reports candidate/rejected data so you can highlight the drop zone, and onAccept fires with the data when the user releases on top of it.',
            ),
            TextBlock(
              'Pair it with a Draggable<T> carrying matching data type T. Use onWillAccept to gate whether a given payload is allowed (returning false rejects it and dims the zone), and onAcceptWithDetails when you need the drop position as well as the data.',
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
