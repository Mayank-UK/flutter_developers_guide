import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class ClipPathWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'ClipPath',
      markdownPath: 'assets/markdowns/widget_catalog/painting_effects/clip_path_markdown.md',
      preview: _ClipPathWidgetImplementation(),
    );
  }
}

class _ClipPathWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'ClipPath crops its child to any arbitrary outline you supply via a CustomClipper<Path> — triangles, stars, waves, diagonal cut-outs, anything beyond the built-in rectangles and ovals. Return a Path from getClip describing the visible region.',
            ),
            TextBlock(
              'Implement shouldReclip to return true only when the clip can actually change (for instance while an animation is driving it), so Flutter doesn\'t recompute the path on every rebuild. For static shapes, returning false keeps the clip cached.',
            ),
            Container(
              child: ClipPath(
                clipper: TriangleClipper(),
                child: Container(
                  color: Colors.amber,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
