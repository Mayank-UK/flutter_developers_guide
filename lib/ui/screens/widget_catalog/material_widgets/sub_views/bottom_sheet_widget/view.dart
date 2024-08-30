import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class BottomSheetWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/bottom_sheet_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'BottomSheet',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _BottomSheetWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _BottomSheetWidgetImplementation extends StatelessWidget {
  void _showModalBottomSheetMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          height: 350.0,
          color: Colors.transparent,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0))),
              child: Center(
                child: Text("This is a modal sheet"),
              )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Modal bottom sheet is shown using a function/method which returns a future that resolves when the modal window is closed.',
            ),
            Container(
              child: ElevatedButton(
                onPressed: () => this._showModalBottomSheetMenu(context),
                child: Text('Show bottom sheet'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
