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
              'A bottom sheet is a Material surface that slides up from the bottom of the screen to reveal supplemental content or contextual actions without leaving the current page. Modal sheets (showModalBottomSheet) dim the rest of the UI and block interaction until dismissed.',
            ),
            TextBlock(
              'showModalBottomSheet returns a Future that resolves when the sheet closes, so you can use it like a dialog to capture a user choice and then continue. Persistent (non-modal) sheets are shown via Scaffold.of(context).showBottomSheet and stay open while the user interacts with the page.',
            ),
            TextBlock(
              'Tip: pass isScrollControlled: true and wrap content in a Padding with viewInsets.bottom so an inner TextField\'s keyboard does not cover the sheet.',
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
