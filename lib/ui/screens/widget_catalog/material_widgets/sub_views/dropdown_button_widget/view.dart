import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class DropdownButtonWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/dropdown_button_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'DropdownButton',
      mobileUi: [
        CodePreviewTabs(
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
              'DropdownButton lets the user pick one value from a short, known set of options. It shows the currently selected item and reveals the full list as an overlay menu when tapped; the chosen value flows back through onChanged.',
            ),
            TextBlock(
              'It is best for 4–12 options that all fit on screen at once. For longer lists (countries, cities), a search-driven dialog or a full page is friendlier than scrolling a tall overlay, and for two-to-four mutually exclusive choices a segmented control communicates the options more clearly.',
            ),
            TextBlock(
              'Note: DropdownButton is the legacy API; in newer code prefer DropdownButtonFormField (which adds validation and integrates with Form) or the Material 3 DropdownMenu which uses a proper menu widget under the hood.',
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
