import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class RefreshIndicatorWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/scrolling/refresh_indicator_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'RefreshIndicator',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _RefreshIndicatorWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _RefreshIndicatorWidgetImplementation extends StatelessWidget {
  Future _onRefresh(context) async {
    return Future<void>.delayed(
      const Duration(seconds: 1),
      () {
        final SnackBar snackBar =
            SnackBar(content: const Text('Data refreshed'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"RefreshIndicator" widget has named parameter onRefresh, which specify the widget\'s behavior.',
            ),
            Container(
              height: 500,
              child: RefreshIndicator(
                onRefresh: () => _onRefresh(context),
                child: ListView.builder(
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.amber,
                      height: 100,
                      margin: const EdgeInsets.only(
                        // top: 8,
                        bottom: 8,
                      ),
                      width: double.infinity,
                      child: Text('$index'),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
