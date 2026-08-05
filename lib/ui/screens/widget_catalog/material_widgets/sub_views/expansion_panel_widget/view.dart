import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ExpansionPanelWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/expansion_panel_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'ExpansionPanel',
      mobileUi: [
        CodePreviewTabs(
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
              'ExpansionPanel is a collapsible Material container used inside an ExpansionPanelList. Each panel has a always-visible header row and a body that reveals itself when the header is tapped — ideal for grouping optional details (advanced settings, FAQ entries) without overwhelming the page.',
            ),
            TextBlock(
              'State — which panels are open — is owned by you, not the widget. You drive it via the list\'s expansionCallback, which hands you the tapped index and the new expanded state; you flip a flag in setState and the list rebuilds accordingly.',
            ),
            TextBlock(
              'Tip: if you only need a single expand/collapse section (not a list), ExpansionTile is far simpler — it manages its own expand state and integrates natively with ListView.',
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
