import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class FutureBuilderWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'FutureBuilder',
      markdownPath: 'assets/markdowns/widget_catalog/async/future_builder_markdown.md',
      preview: _FutureBuilderWidgetImplementation(),
    );
  }
}

class _FutureBuilderWidgetImplementation extends StatefulWidget {
  @override
  __FutureBuilderWidgetImplementationState createState() =>
      __FutureBuilderWidgetImplementationState();
}

class __FutureBuilderWidgetImplementationState
    extends State<_FutureBuilderWidgetImplementation> {
  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 3),
    () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
                'FutureBuilder rebuilds whenever the Future it watches emits a value, throws, or completes — handing your builder an AsyncSnapshot that describes the current state. Use it to drive loading, ready, and error UI from a single one-shot asynchronous result.'),
            TextBlock(
              'Inside the builder, branch on snapshot.connectionState (or hasData/hasError) to paint each phase. Gotcha: pass a stable Future stored in a State field or created in initState; constructing a new Future inline in build re-subscribes on every rebuild and re-runs the work each time.',
            ),
            Container(
              child: FutureBuilder<String>(
                future: _calculation,
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  List<Widget> children;
                  if (snapshot.hasData) {
                    children = <Widget>[
                      const Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 60,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('Result: ${snapshot.data}'),
                      )
                    ];
                  } else if (snapshot.hasError) {
                    children = <Widget>[
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 60,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('Error: ${snapshot.error}'),
                      )
                    ];
                  } else {
                    children = const <Widget>[
                      SizedBox(
                        child: const CircularProgressIndicator(),
                        width: 60,
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: const Text('Awaiting result...'),
                      )
                    ];
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
