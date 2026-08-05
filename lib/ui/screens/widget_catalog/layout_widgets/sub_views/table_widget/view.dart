import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class TableWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'TableWidget',
      markdownPath: 'assets/markdowns/widget_catalog/layout/table_markdown.md',
      preview: _TableWidgetImplementation(),
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
              'Table lays its children out in a strict grid of rows and columns where every row must have the same number of cells (each child of a TableRow is a column cell). Unlike GridView, Table performs a multi-pass layout so columns can be sized from intrinsic content, fixed widths, or flex weights, and rows grow to fit their tallest cell.',
            ),
            TextBlock(
              'columnWidths maps column indices to a TableColumnWidth strategy — IntrinsicColumnWidth (sized to the widest cell), FlexColumnWidth (shares leftover space), FixedColumnWidth (exact pixels), or FractionColumnWidth (fraction of table width). border and defaultVerticalAlignment give you the borders and per-cell vertical alignment for free.',
            ),
            TextBlock(
              'Tip: Table does not scroll on its own. For large data sets wrap it in a SingleChildScrollView, or reach for DataTable / PaginatedDataTable which add sorting, selection, and lazy scrolling on top of a similar column model.',
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
