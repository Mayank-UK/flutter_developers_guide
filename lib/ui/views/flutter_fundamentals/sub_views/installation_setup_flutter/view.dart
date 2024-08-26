import 'package:flutter/material.dart';

import '../../../../components/main_appbar.dart';
import '../../../../components/section_wrapper.dart';
import '../../../../components/content_group_wrapper.dart';
import '../../../../components/text_block.dart';

class InstallationSetupFlutterView extends StatelessWidget {
  final String _appBarTitle = 'Installation and setup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: this._appBarTitle),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SectionWrapper(
              title: 'Installation',
              content: [
                TextBlock(
                  'Follow latest installation step from flutter\'s official website. They have installation steps for windows, macos and linux.',
                ),
                ContentGroupWrapper(
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
                ContentGroupWrapper(
                  title: 'Check installation',
                  content: <Widget>[
                    TextBlock(
                      'Run command "flutter doctor" to confirm proper installation.',
                    ),
                  ],
                ),
                ContentGroupWrapper(
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
        ),
      ),
    );
  }
}
