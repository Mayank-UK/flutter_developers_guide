import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class StepperWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/material/stepper_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Stepper',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _StepperWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
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
              'Stepper is a Material widget that presents a sequential flow as a numbered list of Step entries, where each step shows its title, an optional subtitle, expandable content, and Continue/Cancel controls. The user works through the steps in order, with the current step\'s index tracked via currentStep.',
            ),
            TextBlock(
              'Use it for linear tasks like a multi-field form, an onboarding wizard, or any flow where the user must complete steps in order. The onStepContinue / onStepCancel / onStepTapped callbacks hand control back to you so you can validate the current step before allowing the user to advance.',
            ),
            TextBlock(
              'Tip: Stepper is rigid about its layout. If your flow needs branching, skip-steps, or rich per-step content, build it from a custom widget with an AnimatedSwitcher — Stepper is best for short, simple, strictly linear sequences.',
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
