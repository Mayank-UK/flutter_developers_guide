import 'package:flutter/material.dart';
import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class GestureDetectorWidgetView extends StatelessWidget {
  final String _appBarTitle = 'GestureDetector';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/interactive/gesture_detector_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _GestureDetectorWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _GestureDetectorWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"GestureDetector" widget has named parameters like onTap, onDoubleTap, etc, which specify the widget\'s interactive behavior.',
            ),
            Container(
              child: GestureDetector(
                onTap: () {
                  final SnackBar snackBar =
                      SnackBar(content: const Text('Click/tap registered'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.amber,
                  height: 100,
                  padding: const EdgeInsets.all(16),
                  width: 200,
                  child: Text(
                    'Tap anywhere on this container',
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
