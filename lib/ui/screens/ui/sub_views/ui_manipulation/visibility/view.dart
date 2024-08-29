import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';

class VisibilityView extends StatelessWidget {
  final String _appBarTitle = 'Visibility';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/visibility_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      mobileUi: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
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
            Container(
              child: Text(
                  '"Visibility" widget has a named parameter "visible", which takes a boolean as a value.'),
            ),
            Container(
              child: Text(
                  'Below are two boxes, right one is visible, while left one is not visible and is not taking any space.'),
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
            Container(
              child: Text(
                  '"Opacity" widget has a named parameter "opacity", which takes in a floating point value.'),
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
