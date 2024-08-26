import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ChipWidgetView extends StatelessWidget {
  final String _appBarTitle = 'Chip';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/chip_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _ChipWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
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
              '"Chip" widgets has named parameters like avatar, label, etc, which specify the chip\'s layout.',
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
