import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/design_system/design_system.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class IndexedStackWidgetView extends StatelessWidget {
  final String _appBarTitle = 'IndexedStack';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/indexed_stack_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _IndexedStackWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
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
              '"IndexedStack" widget has a named parameter index, which specify the current index to display.',
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
                            style: DSTypography.subtitle2Light,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          color: Colors.red,
                          child: Text(
                            'Element 2',
                            style: DSTypography.subtitle2Light,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          color: Colors.blue,
                          child: Text(
                            'Element 3',
                            style: DSTypography.subtitle2Light,
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
