import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class DropdownButtonWidgetView extends StatelessWidget {
  final String _appBarTitle = 'DropdownButton';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/dropdown_button_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      mobileUi: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _DropdownButtonWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _DropdownButtonWidgetImplementation extends StatefulWidget {
  @override
  __DropdownButtonWidgetImplementationState createState() =>
      __DropdownButtonWidgetImplementationState();
}

class __DropdownButtonWidgetImplementationState
    extends State<_DropdownButtonWidgetImplementation> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"DropdownButton" widget has named parameters like value, icon, iconSize, items, onChanges, etc, which specify the widget\'s behavior.',
            ),
            Container(
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
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
