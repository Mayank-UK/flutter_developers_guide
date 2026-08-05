import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';


import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class LocationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Location',
      markdownPath: 'assets/markdowns/test.md',
      preview: _LocationImplementation(),
    );
  }
}

class _LocationImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock('Content will be updated soon.'),
            Container(),
          ],
        ),
      ],
    );
  }
}
