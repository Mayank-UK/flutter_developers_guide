import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class TableWidgetView extends StatelessWidget {
  final String _appBarTitle = 'TableWidget';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/table_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _TableWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _TableWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"Table" widget has named parameters like border, columnWidths, etc, which specify the table layout.',
            ),
            Container(
              child: Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  0: IntrinsicColumnWidth(),
                  1: FlexColumnWidth(),
                  2: FixedColumnWidth(64),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      Container(
                        height: 32,
                        color: Colors.green,
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.top,
                        child: Container(
                          height: 32,
                          width: 32,
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        height: 64,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  TableRow(
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                    children: <Widget>[
                      Container(
                        height: 64,
                        width: 128,
                        color: Colors.purple,
                      ),
                      Container(
                        height: 32,
                        color: Colors.yellow,
                      ),
                      Center(
                        child: Container(
                          height: 32,
                          width: 32,
                          color: Colors.orange,
                        ),
                      ),
                    ],
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
