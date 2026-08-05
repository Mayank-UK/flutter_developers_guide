import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class AutoCompleteWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/input/auto_complete_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'AutoComplete',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _AutoCompleteWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _AutoCompleteWidgetImplementation extends StatelessWidget {
  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Autocomplete shows a filtered list of suggestions as the user types and reports the chosen option through onSelected. Use it for searchable inputs backed by a known option set — country pickers, tag entry, command palettes — supplying optionsBuilder to filter the list from the current text.',
            ),
            TextBlock(
              'It manages its own TextEditingController and floating overlay, so it works out of the box with no wiring. To seed an initial value or read the typed text, supply your own controller via the fieldViewBuilder/controller APIs rather than reaching into its internals.',
            ),
            Container(
              child: Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return _kOptions.where((String option) {
                    return option.contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selection) {
                  print('You just selected $selection');
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
