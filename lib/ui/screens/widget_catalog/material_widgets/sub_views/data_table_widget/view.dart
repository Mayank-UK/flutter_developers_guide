import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class DataTableWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'DataTable',
      markdownPath: 'assets/markdowns/widget_catalog/material/data_table_markdown.md',
      preview: _DataTableWidgetImplementation(),
    );
  }
}

class _DataTableWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'DataTable renders rows of structured data in a grid of named columns (DataColumn headers, DataRow cells). It is the right choice for desktop-style tabular content — sortable columns, numeric right-alignment, and row selection — where a ListView of Tiles would lose the column relationship.',
            ),
            TextBlock(
              'Each DataRow can be selected via its selected flag with an onSelectedChanged callback, and columns can declare a numeric: true hint so values are right-aligned and sorted numerically rather than lexically.',
            ),
            TextBlock(
              'Gotcha: DataTable sizes itself to its contents and does not scroll on its own. For many rows, wrap it in a SingleChildScrollView with a horizontal ScrollBar, or reach for PaginatedDataTable which adds paging and column sorting for free.',
            ),
            Container(
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Name',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Age',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Role',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(const Text('Sarah')),
                      DataCell(const Text('19')),
                      DataCell(const Text('Student')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(const Text('Janine')),
                      DataCell(const Text('43')),
                      DataCell(const Text('Professor')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(const Text('William')),
                      DataCell(const Text('27')),
                      DataCell(const Text('Associate Professor')),
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
