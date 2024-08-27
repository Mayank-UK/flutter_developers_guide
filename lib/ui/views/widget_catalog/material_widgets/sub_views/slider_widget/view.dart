import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SliderWidgetView extends StatelessWidget {
  final String _appBarTitle = 'Slider';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/slider_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _SliderWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _SliderWidgetImplementation extends StatefulWidget {
  @override
  __SliderWidgetImplementationState createState() =>
      __SliderWidgetImplementationState();
}

class __SliderWidgetImplementationState
    extends State<_SliderWidgetImplementation> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"Slider" widget has named parameters like value, min, man, division, label, etc, which specify the widget\'s behavior and it\'s content.',
            ),
            Container(
              child: Slider(
                value: _currentSliderValue,
                min: 0,
                max: 100,
                divisions: 5,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
