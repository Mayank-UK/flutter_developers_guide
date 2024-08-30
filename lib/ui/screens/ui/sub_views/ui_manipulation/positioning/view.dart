import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';

class PositioningView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/positioning_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Positioning',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _PositioningImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _PositioningImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Using "Stack" widget with "Positioned" widget',
          content: [
            Container(
              child: Text(
                  '"Stack" widget serves as the parent and "Positioned" widgets serves as the children.'),
            ),
            Container(
              child: Text(
                  'Each "Positioned" widget child can be positioned individually using named parameters "top", "right", "bottom" and "left".'),
            ),
            Container(
              color: Colors.amber,
              height: 300,
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Container(
                      color: Colors.red,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Positioned(
                      top: 20,
                      right: 20,
                      child: Container(
                        color: Colors.red,
                        height: 100,
                        width: 100,
                      )),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
