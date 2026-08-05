import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class DismissibleWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Dismissible',
      markdownPath: 'assets/markdowns/widget_catalog/interactive/dismissible_markdown.md',
      preview: _DismissibleWidgetImplementation(),
    );
  }
}

class _DismissibleWidgetImplementation extends StatefulWidget {
  @override
  __DismissibleWidgetImplementationState createState() =>
      __DismissibleWidgetImplementationState();
}

class __DismissibleWidgetImplementationState
    extends State<_DismissibleWidgetImplementation> {
  List<int> items = List<int>.generate(100, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Dismissible lets a list item be swiped or dragged away — once dragged past a threshold in the given DismissDirection, it slides out of view and onDismissed fires so you can remove it from your data source. It\'s the standard pattern for swipe-to-delete on list items.',
            ),
            TextBlock(
              'Every Dismissible must have a stable Key so Flutter can track it through the dismiss animation, and you must actually remove the item from your list inside onDismissed — otherwise the next rebuild will build a Dismissible that no longer matches and throw. Use the background (and secondaryBackground) to paint the colored delete/confirm panel revealed behind the sliding child.',
            ),
            Container(
              color: Colors.amber,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: ValueKey<int>(items[index]),
                    background: Container(
                      color: Colors.green,
                    ),
                    onDismissed: (DismissDirection direction) {
                      setState(() {
                        items.removeAt(index);
                      });
                    },
                    child: ListTile(
                      title: Text(
                        'Item ${items[index]}',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
