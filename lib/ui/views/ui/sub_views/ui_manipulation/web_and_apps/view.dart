import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';

class WebAndAppsView extends StatelessWidget {
  final String _appBarTitle = 'Web & apps';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/hyperlinks_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabs(
      appBarTitle: this._appBarTitle,
      previewTab: _HyperlinksImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class _HyperlinksImplementation extends StatelessWidget {
  void _onTapWhatsapp() async {
    String whatsappUrl = 'https://api.whatsapp.com/send?text=\'test string\'';

    await launch(whatsappUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Hyperlinks',
          content: [
            TextBlock(
              'Just import the package and use \'launch(\'String\')\' function.',
            ),
            TextBlock(
              'If the app exists in phone to open the url, it will launch the app or else it will launch default browser to open the url.',
            ),
            TextBlock(
              ' On web it will open the url on browser tab.',
            ),
            Container(
              child: ElevatedButton(
                onPressed: _onTapWhatsapp,
                child: Text('Share to whatsapp'),
              ),
            ),
          ],
        ),
        SectionWrapper(
          title: 'WebView',
          content: [
            TextBlock(
              'Will be implemented.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'External apps',
          content: [
            TextBlock(
              'Will be implemented.',
            ),
          ],
        ),
      ],
    );
  }
}
