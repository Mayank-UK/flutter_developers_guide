import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class StreamBuilderWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/async/stream_builder_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'StreamBuilder',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _StreamBuilderWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _StreamBuilderWidgetImplementation extends StatefulWidget {
  @override
  __StreamBuilderWidgetImplementationState createState() =>
      __StreamBuilderWidgetImplementationState();
}

class __StreamBuilderWidgetImplementationState
    extends State<_StreamBuilderWidgetImplementation> {
  final Stream<int> _bids = (() async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield 1;
    await Future<void>.delayed(const Duration(seconds: 1));
  })();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'StreamBuilder rebuilds on every event a Stream emits, giving your builder an AsyncSnapshot of the latest value along with the connection state. Use it for ongoing asynchronous data — a BLoC\'s state stream, WebSocket messages, periodic ticks — where the UI must react to a sequence of values rather than a single result.',
            ),
            TextBlock(
              'It distinguishes waiting, active, and done so you can render each phase separately. As with FutureBuilder, pass a stable stream stored in State (and cancel it in dispose) — creating a stream inline in build tears down and recreates the subscription on every rebuild.',
            ),
            Container(
              child: StreamBuilder<int>(
                stream: _bids,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  List<Widget> children;
                  if (snapshot.hasError) {
                    children = <Widget>[
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('Error: ${snapshot.error}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text('Stack trace: ${snapshot.stackTrace}'),
                      ),
                    ];
                  } else {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        children = const <Widget>[
                          Icon(
                            Icons.info,
                            color: Colors.blue,
                            size: 60,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text('Select a lot'),
                          )
                        ];
                        break;
                      case ConnectionState.waiting:
                        children = const <Widget>[
                          SizedBox(
                            child: CircularProgressIndicator(),
                            width: 60,
                            height: 60,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text('Awaiting bids...'),
                          )
                        ];
                        break;
                      case ConnectionState.active:
                        children = <Widget>[
                          const Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                            size: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text('\$${snapshot.data}'),
                          )
                        ];
                        break;
                      case ConnectionState.done:
                        children = <Widget>[
                          const Icon(
                            Icons.info,
                            color: Colors.blue,
                            size: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text('\$${snapshot.data} (closed)'),
                          )
                        ];
                        break;
                    }
                  }

                  return Column(
                    children: children,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
