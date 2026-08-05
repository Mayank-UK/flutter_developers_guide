import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ChipWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/chip_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Chip',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _ChipWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ChipWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Chip is a compact Material element that represents a complex entity — a contact, a filter tag, a category, a selection — as a small rounded block with an optional leading avatar and a label.',
            ),
            TextBlock(
              'Use it to surface metadata or to give the user something tappable to delete/edit a selected item. Because chips are short, they are commonly laid out in a Wrap so they flow onto multiple lines as the set grows.',
            ),
            TextBlock(
              'Tip: for tappable, selectable, or deletable variants prefer ActionChip, ChoiceChip, FilterChip, or InputChip — they encode the right semantics (onPressed, onSelected, onDeleted) and accessibility behavior for free, instead of you wiring gestures onto a plain Chip.',
            ),
            Container(
              child: Chip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.grey.shade800,
                  child: const Text('AB'),
                ),
                label: const Text('Aaron Burr'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
