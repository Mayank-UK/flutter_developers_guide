import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class InstallationSetupFlutterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Installation and setup",
      mobileUi: [
        SectionWrapper(
          title: 'Installation',
          content: [
            TextBlock(
              'Follow latest installation step from flutter\'s official website. They have installation steps for windows, macos and linux.',
            ),
            SectionWrapper(tinted: false, runSpacing: 4, titleStyle: Theme.of(context).textTheme.bodyLarge,
              title: 'Installation software list:',
              content: <Widget>[
                Container(
                  width: double.infinity,
                  child: const Text('Flutter SDK'),
                ),
                Container(
                  width: double.infinity,
                  child: const Text('Android Studio'),
                ),
                Container(
                  width: double.infinity,
                  child: const Text('Git'),
                ),
              ],
            ),
            SectionWrapper(tinted: false, runSpacing: 4, titleStyle: Theme.of(context).textTheme.bodyLarge,
              title: 'Check installation',
              content: <Widget>[
                TextBlock(
                  'Run command "flutter doctor" to confirm proper installation.',
                ),
              ],
            ),
            SectionWrapper(tinted: false, runSpacing: 4, titleStyle: Theme.of(context).textTheme.bodyLarge,
              title: 'In case of installation errors',
              content: <Widget>[
                TextBlock(
                  'Check if all the required software are properly installed.',
                ),
                TextBlock(
                  'Check if all the environment variables are properly set.',
                ),
              ],
            ),
          ],
        ),
        SectionWrapper(
          title: 'Setup with IDE',
          content: [
            TextBlock(
              'Install official "dart" and "flutter" plugins from plugins/extensions marketplace of your desired IDE.',
            ),
          ],
        ),
      ],
    );
  }
}
