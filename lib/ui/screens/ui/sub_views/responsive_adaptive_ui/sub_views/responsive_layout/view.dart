import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/responsive_layout.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';

import '../../../../../../components/code_preview_tabs.dart';
import '../../../../../../components/section_wrapper.dart';

class ResponsiveLayoutView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/responsive_adaptive_layout/responsive_layout_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Responsive layout',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _ResponsiveLayoutImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ResponsiveLayoutImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Basics',
          content: [
            TextBlock(
                "Responsiveness means the layout adapts to the available screen size. Unlike CSS, Flutter has no media queries by default, so the typical pattern is to read the constraints once and pick a layout variant."),
            TextBlock(
                "The simplest implementation is a single \"ResponsiveLayout\" widget that takes three builders — mobileUi, tabletUi, desktopUi — and returns whichever one matches the current width. The breakpoints are decided inside the widget so call sites stay declarative."),
            TextBlock(
                "Tip: prefer \"LayoutBuilder\" over \"MediaQuery\" when the decision depends on the parent box rather than the whole window, so the same widget behaves correctly inside split views and large dialogs as well as full-screen."),
          ],
        ),
        SectionWrapper(
          title: 'Example implementation',
          content: [
            ResponsiveLayout(
              mobileLayout: Container(
                color: Colors.yellow,
                height: 64,
              ),
              tabletLayout: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                      height: 64,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                      height: 64,
                    ),
                  ),
                ],
              ),
              desktopLayout: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                      height: 64,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                      height: 64,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                      height: 64,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
