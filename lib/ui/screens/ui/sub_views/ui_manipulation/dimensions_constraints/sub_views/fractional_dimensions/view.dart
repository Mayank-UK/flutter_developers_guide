import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../../../components/section_wrapper.dart';
import '../../../../../../../components/text_block.dart';

class FractionalDimensionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Screen fraction dimensions',
      markdownPath: 'assets/markdowns/ui/ui_manipulation/dimensions_constraints/fractional_full_screen_dimensions.md',
      preview: _FractionalDimensionsImplementation(),
    );
  }
}

class _FractionalDimensionsImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Using "MediaQuery"',
          content: [
            TextBlock(
              '"MediaQuery.of(context).size" returns the full screen dimensions, so multiplying it by a fraction yields a size relative to the whole window rather than the immediate parent.',
            ),
            TextBlock(
              'This is the right tool for full-screen overlays, banners, or page-level boxes, but it does not reflect safe areas or keyboard insets — combine with "MediaQuery.of(context).padding" or use "SafeArea" to avoid the notch and the IME.',
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.amber,
              height: MediaQuery.of(context).size.height * 0.10,
              width: MediaQuery.of(context).size.width * 0.75,
              child: const Text('10% height and 75% width of screen'),
            )
          ],
        ),
      ],
    );
  }
}
