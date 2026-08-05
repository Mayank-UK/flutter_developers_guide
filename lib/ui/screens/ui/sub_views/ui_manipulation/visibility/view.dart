import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class VisibilityView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/visibility_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Visibility',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _VisibilityImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _VisibilityImplementation extends StatefulWidget {
  @override
  _VisibilityImplementationState createState() =>
      _VisibilityImplementationState();
}

class _VisibilityImplementationState extends State<_VisibilityImplementation> {
  bool isSwitchedVisible = true;
  bool isSwitchedOpacity = true;
  double opacity = 1;

  void toggleSwitchVisibility(bool value) {
    if (this.isSwitchedVisible == false) {
      setState(() {
        this.isSwitchedVisible = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        this.isSwitchedVisible = false;
      });
      print('Switch Button is OFF');
    }
  }

  void toggleSwitchOpacity(bool value) {
    if (this.isSwitchedOpacity == false) {
      setState(() {
        this.isSwitchedOpacity = true;
        this.opacity = 1;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        this.isSwitchedOpacity = false;
        this.opacity = 0;
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Using "Visibility" widget for not occupy space',
          content: [
            TextBlock(
              'The "Visibility" widget fully removes its child from the layout when "visible" is false. The surrounding siblings reflow as if it were never there, which is what you want for "show more" toggles and conditional sections.',
            ),
            TextBlock(
              'The widget also accepts "replacement" (a placeholder, defaulting to an empty "SizedBox"), "maintainState", and "maintainAnimation" if you need to keep controllers and animations alive while hidden.',
            ),
            Wrap(
              spacing: 8,
              children: <Widget>[
                Wrap(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Switch(
                        value: this.isSwitchedVisible,
                        onChanged: this.toggleSwitchVisibility),
                    Text("Box visibility: ${this.isSwitchedVisible}")
                  ],
                ),
                Visibility(
                  visible: this.isSwitchedVisible,
                  child: Container(
                    color: Colors.amber,
                    height: 100,
                    width: 100,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  color: Colors.red,
                  height: 50,
                  padding: EdgeInsets.all(8),
                  width: 100,
                  child: const Text('Layout element'),
                ),
              ],
            ),
          ],
        ),
        SectionWrapper(
          title: 'Using "Opacity" widget for occupying space',
          content: [
            TextBlock(
              'When a hidden widget must still take up space (so neighbors don\'t shift), keep it in the tree and fade it with "Opacity" or "Visibility" with "maintainSize: true". The slot stays reserved and only the paint is suppressed.',
            ),
            TextBlock(
              'For animated fade-ins and fade-outs use "AnimatedOpacity" or "FadeTransition"; both avoid the save layer cost of a static "Opacity" and animate smoothly across frames.',
            ),
            Wrap(
              spacing: 8,
              children: <Widget>[
                Wrap(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Switch(
                        value: this.isSwitchedOpacity,
                        onChanged: this.toggleSwitchOpacity),
                    Text("Box opacity: ${this.opacity}"),
                  ],
                ),
                Opacity(
                  opacity: this.opacity,
                  child: Container(
                    color: Colors.amber,
                    height: 100,
                    width: 100,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  color: Colors.red,
                  height: 50,
                  padding: EdgeInsets.all(8),
                  width: 100,
                  child: const Text('Layout element'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
