import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class LayoutBuilderWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/layout_builder_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'LayoutBuilder',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _LayoutBuilderWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _LayoutBuilderWidgetImplementation extends StatelessWidget {
  Widget _buildNormalContainer() {
    return Container(
      height: 100.0,
      width: 100.0,
      color: Colors.red,
    );
  }

  Widget _buildWideContainers() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          color: Colors.red,
        ),
        Container(
          height: 100.0,
          width: 100.0,
          color: Colors.yellow,
        ),
      ],
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
                '"LayoutBuilder" widget has a named parameter builder, which specify the function for building the layout tree.'),
            Container(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (constraints.maxWidth > 600) {
                    return _buildWideContainers();
                  } else {
                    return _buildNormalContainer();
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
