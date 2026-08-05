import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class NotificationListenerWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/scrolling/notification_listener_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'NotificationListener',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _NotificationListenerWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _NotificationListenerWidgetImplementation extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  bool _onNotification(scrollState) {
    if (scrollState is ScrollEndNotification &&
        scrollState.metrics.pixels != 160) {
      Future.delayed(const Duration(milliseconds: 100), () {}).then(
        (s) {
          _scrollController.animateTo(160,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
      );
    }

    return false;
  }

  Widget _getList() {
    return ListView.builder(
      itemBuilder: (BuildContext ctx, index) {
        return NotificationListener<ScrollNotification>(
          onNotification: (scrollState) => this._onNotification(scrollState),
          child: Container(
            height: 50,
            margin: EdgeInsets.only(bottom: 1),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  color: Colors.amber,
                  height: 20,
                  width: 360,
                  child: const Text(
                    'Scroll to left/right',
                  ),
                ),
                Container(
                  color: Colors.blue,
                  height: 20,
                  width: 100,
                ),
              ],
            ),
          ),
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
              'NotificationListener interceptes Notifications that bubble up from descendants and hands them to an onNotification callback before they reach the root. Returning true cancels the notification\'s journey up the tree; false lets it continue.',
            ),
            TextBlock(
              'It is most commonly used to observe ScrollNotification (scroll position, overscroll, momentum) from any scrollable without holding its controller — handy for showing/hiding a header, triggering infinite scroll, or snapping to a position. The same mechanism also surfaces things like ScrollMetricsNotification and LayoutChangedNotification.',
            ),
            Container(
              height: 500,
              child: _getList(),
            ),
          ],
        ),
      ],
    );
  }
}
