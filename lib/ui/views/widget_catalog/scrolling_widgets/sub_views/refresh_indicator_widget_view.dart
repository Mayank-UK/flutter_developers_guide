import 'package:flutter/material.dart';

import '../../../../components/code_preview_component.dart';
import './../../../../components/section_wrapper_component_component.dart';
import './../../../../components/text_block_component.dart';

class RefreshIndicatorWidgetView extends StatelessWidget {
  final String _appBarTitle = 'RefreshIndicator';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/scrolling/refresh_indicator_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabsComponent(
      appBarTitle: this._appBarTitle,
      previewTab: _RefreshIndicatorWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
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
        SectionWrapperComponent(
          title: 'Simple use',
          content: [
            TextBlockComponent(
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
