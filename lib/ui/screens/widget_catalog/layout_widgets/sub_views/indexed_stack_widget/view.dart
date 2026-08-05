import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class IndexedStackWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'IndexedStack',
      markdownPath: 'assets/markdowns/widget_catalog/layout/indexed_stack_markdown.md',
      preview: _IndexedStackWidgetImplementation(),
    );
  }
}

class _IndexedStackWidgetImplementation extends StatefulWidget {
  @override
  __IndexedStackWidgetImplementationState createState() =>
      __IndexedStackWidgetImplementationState();
}

class __IndexedStackWidgetImplementationState
    extends State<_IndexedStackWidgetImplementation> {
  int _index = 0;

  void onPressed() {
    setState(() {
      if (this._index == 2) {
        this._index = 0;
        return;
      }

      this._index += 1;
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
              'IndexedStack displays exactly one of its children at a time, identified by the index parameter — like a tab bar without the tab strip. Unlike Offstage or Visibility, IndexedStack keeps all non-selected children in the tree: they are sized and laid out but not painted or hit-tested.',
            ),
            TextBlock(
              'This matters for state preservation: switching index keeps each child\'s state (scroll offsets, text fields, controllers) alive because the widgets are never disposed. The trade-off is that every child is built up-front, so for very large or expensive children prefer a PageView or a lazy tab solution.',
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    child: IndexedStack(
                      index: this._index,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          color: Colors.amber,
                          child: Text(
                            'Element 1',
                            // style: DSTypography.subtitle2Light,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          color: Colors.red,
                          child: Text(
                            'Element 2',
                            // style: DSTypography.subtitle2Light,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          color: Colors.blue,
                          child: Text(
                            'Element 3',
                            // style: DSTypography.subtitle2Light,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: this.onPressed,
                    child: Text('Next element'),
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
