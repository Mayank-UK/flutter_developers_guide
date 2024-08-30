import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class DismissibleWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/interactive/dismissible_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Dismissible',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _DismissibleWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
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
              '"Dismissible" widget has named parameters like background, onDismissed, etc, which specify the layout of it\'s child.',
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
