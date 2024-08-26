    class _StepperWidgetImplementation extends StatefulWidget {
        @override
        __StepperWidgetImplementationState createState() => __StepperWidgetImplementationState();
    }

    class __StepperWidgetImplementationState extends State<_StepperWidgetImplementation> {
        int _index = 0;

        @override
        Widget build(BuildContext context) {
            return Wrap(
                children: <Widget>[
                    SectionWrapperComponent(
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
