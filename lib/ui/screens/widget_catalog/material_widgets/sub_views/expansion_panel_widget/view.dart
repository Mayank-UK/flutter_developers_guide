import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ExpansionPanelWidgetView extends StatelessWidget {
  final String _appBarTitle = 'ExpansionPanel';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/expansion_panel_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      mobileUi: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _ExpansionPanelWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class _ExpansionPanelWidgetImplementation extends StatefulWidget {
  @override
  __ExpansionPanelWidgetImplementationState createState() =>
      __ExpansionPanelWidgetImplementationState();
}

class __ExpansionPanelWidgetImplementationState
    extends State<_ExpansionPanelWidgetImplementation> {
  final List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"ExpansionPanel" widget has named parameters expansionCallback, children, etc, which specifies the widget\'s behavior and content.',
            ),
            Container(
              child: ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _data[index].isExpanded = !isExpanded;
                  });
                },
                children: _data.map<ExpansionPanel>((Item item) {
                  return ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(item.headerValue),
                      );
                    },
                    body: ListTile(
                        title: Text(item.expandedValue),
                        subtitle: const Text(
                            'To delete this panel, tap the trash can icon'),
                        trailing: const Icon(Icons.delete),
                        onTap: () {
                          setState(() {
                            _data.removeWhere(
                                (Item currentItem) => item == currentItem);
                          });
                        }),
                    isExpanded: item.isExpanded,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
