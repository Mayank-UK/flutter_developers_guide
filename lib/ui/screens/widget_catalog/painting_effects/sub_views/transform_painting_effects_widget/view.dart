import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class TransformPaintingEffectsWidgetView extends StatelessWidget {
  final String _codeTabMarkdownLocation = 'assets/markdowns/test.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'TransformPaintingEffects',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _TransformPaintingEffectsWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _TransformPaintingEffectsWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'Transform applies a matrix transformation — translate, scale, rotate, or skew — to its child during the paint phase. Use the named constructors (Transform.translate, Transform.scale, Transform.rotate) for readability; set `origin` or `alignment` to control the pivot point.',
            ),
            TextBlock(
              'Because the transform is paint-only, layout and hit-testing stay in the child\'s original coordinate space: a rotated button still occupies its unrotated box. When you need layout to follow the rotation (so siblings wrap around the rotated footprint), use RotatedBox for whole quarter turns instead.',
            ),
          ],
        ),
      ],
    );
  }
}
