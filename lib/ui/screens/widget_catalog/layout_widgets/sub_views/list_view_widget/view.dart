import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ListViewWidgetView extends StatelessWidget {
  final String _appBarTitle = 'ListView';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/list_view_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _ListViewWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ListViewWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"ListView" widget has many builder like ListView.builder, ListView.separator, etc, for different layouts.',
            ),
            TextBlock(
              '"ListView" widget has named parameter like shrinkWrap, itemCount, itemBuilder, which specify the building of list.',
            ),
            Container(
              height: 500,
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.amber,
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Center(
                      child: Text('Entry $index'),
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
