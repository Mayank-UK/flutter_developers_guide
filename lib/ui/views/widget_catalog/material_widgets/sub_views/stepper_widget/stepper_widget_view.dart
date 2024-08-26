import 'package:flutter/material.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class StepperWidgetView extends StatelessWidget {
  final String _appBarTitle = 'Stepper';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/stepper_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _StepperWidgetImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _StepperWidgetImplementation extends StatefulWidget {
  @override
  __StepperWidgetImplementationState createState() =>
      __StepperWidgetImplementationState();
}

class __StepperWidgetImplementationState
    extends State<_StepperWidgetImplementation> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              '"Stepper" widget has named parameters like currentStep, onStepCancel, onStepContinue, etc, which specify the stepper\'s behavior and UI.',
            ),
            Container(
              child: Stepper(
                currentStep: _index,
                onStepCancel: () {
                  if (_index <= 0) {
                    return;
                  }
                  setState(() {
                    _index--;
                  });
                },
                onStepContinue: () {
                  if (_index >= 1) {
                    return;
                  }
                  setState(() {
                    _index++;
                  });
                },
                onStepTapped: (index) {
                  setState(() {
                    _index = index;
                  });
                },
                steps: [
                  Step(
                    title: Text("Step 1 title"),
                    content: Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Content for Step 1")),
                  ),
                  Step(
                    title: Text("Step 2 title"),
                    content: Text("Content for Step 2"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
