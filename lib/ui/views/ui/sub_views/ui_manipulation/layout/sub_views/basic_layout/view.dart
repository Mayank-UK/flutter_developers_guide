import 'package:flutter/material.dart';

import '../../../../../../../components/code_preview_tabs.dart';
import '../../../../../../../components/section_wrapper.dart';

class BasicLayoutView extends StatelessWidget {
  final String _appBarTitle = 'Basic layout';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/layout/basic_layout_widgets_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _BasicLayoutImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _BasicLayoutImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Using "Container" widget',
          content: [
            Container(
              child: Text(
                  '"Container" widget provides the most basic and widely used wrapper around a child widget. It can be used to add alignment, borders, backgrounds, padding, margin, etc.'),
            ),
            Container(
              color: Colors.amber,
              padding: EdgeInsets.all(8),
              child: const Text('Text inside a container'),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Using "Row" widget',
          content: [
            Container(
              child: Text(
                  '"Row" widget takes a number of children and display them in horizontal direction one after the another until the space runs out.'),
            ),
            Container(
              child: Text(
                  'It is preferred to use a "Wrap" widget for additional benefits like spacing between children and wrapping, etc.'),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  color: Colors.amber,
                  height: 50,
                  margin: EdgeInsets.only(right: 8),
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  margin: EdgeInsets.only(right: 8),
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  margin: EdgeInsets.only(right: 8),
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  margin: EdgeInsets.only(right: 8),
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  margin: EdgeInsets.only(right: 8),
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  margin: EdgeInsets.only(right: 8),
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  margin: EdgeInsets.only(right: 8),
                  width: 50,
                ),
              ],
            )
          ],
        ),
        SectionWrapper(
          title: 'Using "Column" widget',
          content: [
            Container(
              child: Text(
                  '"Column" widget takes a number of children and display them in vertical direction on after the another until the space runs out.'),
            ),
            Container(
              child: Text(
                  'It is preferred to use a "Wrap" widget for additional benefits like spacing between children and wrapping, etc.'),
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.amber,
                    height: 50,
                    margin: EdgeInsets.only(bottom: 8),
                    width: 50,
                  ),
                  Container(
                    color: Colors.amber,
                    height: 50,
                    margin: EdgeInsets.only(bottom: 8),
                    width: 50,
                  ),
                  Container(
                    color: Colors.amber,
                    height: 50,
                    margin: EdgeInsets.only(bottom: 8),
                    width: 50,
                  ),
                  Container(
                    color: Colors.amber,
                    height: 50,
                    margin: EdgeInsets.only(bottom: 8),
                    width: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Using "Wrap" widget',
          content: [
            Container(
              child: Text(
                  '"Wrap" widget can be used to layout items horizontally like a row or vertically like a column , it takes a named parameter "direction", which takes a value from "Axis" enum. It places it\'s children to new position if it runs out of space.'),
            ),
            Container(
              child: const Text('Wrap in horizontal with spacing of 8'),
            ),
            Wrap(
              direction: Axis.horizontal,
              runSpacing: 8,
              spacing: 8,
              children: <Widget>[
                Container(
                  color: Colors.amber,
                  height: 50,
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  width: 50,
                ),
                Container(
                  color: Colors.amber,
                  height: 50,
                  width: 50,
                ),
              ],
            ),
            Container(
              width: double.infinity,
              child:
                  const Text('Wrap in vertical direction with spacing of 8.'),
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: Wrap(
                direction: Axis.vertical,
                runSpacing: 8,
                spacing: 8,
                children: <Widget>[
                  Container(
                    color: Colors.amber,
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    color: Colors.amber,
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    color: Colors.amber,
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    color: Colors.amber,
                    height: 50,
                    width: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
        SectionWrapper(
          title: 'Other widgets',
          content: [
            Container(
              child: Text(
                  'There are other widgets like "SizedBox", "LimitedBox", "DecoratedBox", "Padding" etc, but most of them can be easily substituted by the "Container" widget which derives most of their functionality.'),
            ),
          ],
        ),
      ],
    );
  }
}
