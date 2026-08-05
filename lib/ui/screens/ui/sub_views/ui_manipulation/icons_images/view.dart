import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class IconsImagesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Icons and images',
      markdownPath: 'assets/markdowns/ui/ui_manipulation/icons_images_markdown.md',
      preview: _IconsImagesImplementation(),
    );
  }
}

class _IconsImagesImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Using "Icon" widget',
          content: [
            TextBlock(
              'The "Icon" widget renders a vector glyph from a font such as Material or Cupertino. Its first positional parameter selects the glyph (e.g. "Icons.favorite"), and "size", "color", and "semanticLabel" style it.',
            ),
            TextBlock(
              'Icon color follows "IconTheme", which in turn resolves from the ambient "ThemeData.iconTheme", so a single theme tweak restyles every icon. For custom fonts, ship the .ttf and reference it via "FontLoader" or pubspec "fonts:".',
            ),
            Icon(
              Icons.favorite,
              size: 32,
            ),
          ],
        ),
        SectionWrapper(
          title: 'Using "Image" widget',
          content: [
            TextBlock(
              'The "Image" widget renders a raster picture. Its "image" parameter accepts an "ImageProvider"; the two most common are "NetworkImage" (a remote URL) and "AssetImage" (a file bundled through pubspec.yaml).',
            ),
            TextBlock(
              'Use the named constructors "Image.network" and "Image.asset" for the same result with less boilerplate. Add a "loadingBuilder" for spinners and an "errorBuilder" for broken sources so the UI never shows a blank box.',
            ),
            Container(
              width: double.infinity,
              child:
                  const Text('Using "NetworkImage" class for network images'),
            ),
            Image(
              height: 100,
              width: 100,
              image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
            ),
            Container(
              child: Text(
                  'Using "AssetImage" class for local images (first include the images in pubspec.yaml)'),
            ),
            Image(
              height: 100,
              width: 100,
              image: AssetImage('assets/images/demo.jpeg'),
            ),
          ],
        ),
      ],
    );
  }
}
