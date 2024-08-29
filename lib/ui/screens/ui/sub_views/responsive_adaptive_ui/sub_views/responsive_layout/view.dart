import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/responsive_layout.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';

import '../../../../../../components/code_preview_tabs.dart';
import '../../../../../../components/section_wrapper.dart';

class ResponsiveLayoutView extends StatelessWidget {
  final String _appBarTitle = 'Responsive layout';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/responsive_adaptive_layout/responsive_layout_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      mobileUi: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
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
                "The UI should be responsive to all the screen sizes. Although in flutter responsiveness is not as simple as web, but it's doable."),
            TextBlock(
                "The simple idea to implement is having a responsive layout component that will take 3 parameters which includes mobileUi, tabletUi, desktopUi and render the most appropriate one based on screen.")
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
