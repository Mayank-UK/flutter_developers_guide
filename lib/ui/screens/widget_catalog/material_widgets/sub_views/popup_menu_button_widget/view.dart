import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class PopupMenuButtonWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'PopupMenuButton',
      markdownPath: 'assets/markdowns/widget_catalog/material/popup_menu_button_markdown.md',
      preview: _PopupMenuButtonWidgetImplementation(),
    );
  }
}

class _PopupMenuButtonWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'PopupMenuButton displays an icon (three dots by default) that opens a small overlay menu of options when tapped. It is the standard place to stash secondary, contextual, or "overflow" actions on a screen or list item — things like Sort, Filter, Share, Settings — that would clutter the UI if always visible.',
            ),
            TextBlock(
              'You supply options via itemBuilder, which returns a list of PopupMenuItem widgets; each item carries a value that is handed back to onSelected when the user picks it. The generic type of the values lets the compiler check that onSelected matches the items you build.',
            ),
            TextBlock(
              'Tip: pair PopupMenuButton with the AppBar actions: list so overflow actions sit naturally at the top-right. For a single item\'s contextual menu, use the per-row IconButton variant instead of a global popup.',
            ),
            Container(
              color: Colors.blue,
              child: PopupMenuButton(
                itemBuilder: (BuildContext bc) => [
                  PopupMenuItem(
                    child: Text("New Chat"),
                    value: "/newchat",
                  ),
                  PopupMenuItem(
                    child: Text("New Group Chat"),
                    value: "/new-group-chat",
                  ),
                  PopupMenuItem(
                    child: Text("Settings"),
                    value: "/settings",
                  ),
                ],
                onSelected: (value) {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
