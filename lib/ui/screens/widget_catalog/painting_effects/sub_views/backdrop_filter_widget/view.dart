import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';
import 'dart:ui' as ui;

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class BackdropFilterWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'BackdropFilter',
      markdownPath: 'assets/markdowns/widget_catalog/painting_effects/backdrop_filter_markdown.md',
      preview: _BackdropFilterWidgetImplementation(),
    );
  }
}

class _BackdropFilterWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'BackdropFilter applies an ImageFilter to everything already painted behind it, then paints its child on top. The classic use is the frosted-glass blur: stack it over an image or text and the background shows through, smeared by your filter.',
            ),
            TextBlock(
              'It is expensive — every frame re-runs the filter over the area underneath, and non-local filters like blur cost the most. Keep the filtered region small (wrap it in a ClipRect/ClipRRect to constrain it) and avoid stacking many BackdropFilters inside a scrolling list.',
            ),
            Container(
              height: 200,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Text('0' * 10000),
                  Center(
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ui.ImageFilter.blur(
                          sigmaX: 5.0,
                          sigmaY: 5.0,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: 100.0,
                          height: 100.0,
                          child: Text('Hello World'),
                        ),
                      ),
                    ),
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
