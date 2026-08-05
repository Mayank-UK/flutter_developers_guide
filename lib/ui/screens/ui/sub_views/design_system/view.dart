import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/section_wrapper.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

class DesignSystemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Design system',
      markdownPath: 'assets/markdowns/ui/design_system/design_system_markdown.md',
      preview: _AlignmentImplementation(),
    );
  }
}

class _AlignmentImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'What a design system is for',
          content: [
            TextBlock(
              'A design system captures colors, typography, spacing, shape, and motion in named tokens so every screen resolves to the same look. In this app the tokens live in "lib/ui/design_system/" (e.g. "DSSizes") and resolve through "Theme.of(context)", which itself is driven by "MaterialApp.theme".',
            ),
            TextBlock(
              'Because the source of truth is the "ThemeData", flipping between light and dark mode — or re-skinning the whole app — is a one-line change. Widgets never hard-code colors or sizes; they read from "colorScheme", "textTheme", and the "DSSizes" constants instead.',
            ),
            TextBlock(
              'Tip: when adding a new token, prefer extending "DSSizes" (or a parallel "DSColors" class) over inventing per-file constants. Central tokens are what let "SectionWrapper", "TextBlock", and the rest stay consistent without each one re-deciding what "md" means.',
            ),
          ],
        ),
      ],
    );
  }
}
