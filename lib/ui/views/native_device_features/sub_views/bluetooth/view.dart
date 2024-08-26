import 'package:flutter/material.dart';

import '../../../../components/code_preview_tabs.dart';

import '../../../../components/code_preview_tabs.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class BluetoothView extends StatelessWidget {
  final String _appBarTitle = 'Bluetooth';
  final String _codeTabMarkdownLocation = 'assets/markdowns/test.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _BluetoothImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _BluetoothImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock('Content will be updated soon.'),
            Container(),
          ],
        ),
      ],
    );
  }
}
