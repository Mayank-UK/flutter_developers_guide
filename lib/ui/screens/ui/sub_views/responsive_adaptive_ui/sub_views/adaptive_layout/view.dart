import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../../components/section_wrapper.dart';

class AdaptiveLayoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Adaptive layout',
      markdownPath: 'assets/markdowns/ui/responsive_adaptive_layout/adaptive_layout_markdown.md',
      preview: _AdaptiveLayoutImplementation(),
    );
  }
}

class _AdaptiveLayoutImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Adaptive layout',
          content: [
            TextBlock(
                "Adaptive UI tailors the look to the host platform: iOS-style controls on Apple devices, Material controls on Android, and native-feeling chrome on desktop and web. The shape, transitions, and even the back button differ."),
            TextBlock(
                "Flutter ships two parallel design-system widget sets — \"material/\" for Android and \"cupertino/\" for iOS — plus \"Theme.of(context).platform\" to detect the running OS at runtime. Switch widgets or styles on that value, or use the \"flutter_platform_widgets\" package for a unified API."),
            TextBlock(
                "Gotcha: don\'t over-fit to one platform. Pick a baseline (usually Material) and only fork the few widgets where users expect platform-native behavior — navigation bars, switches, page transitions. Keeping the rest shared keeps the codebase maintainable."),
          ],
        ),
      ],
    );
  }
}
