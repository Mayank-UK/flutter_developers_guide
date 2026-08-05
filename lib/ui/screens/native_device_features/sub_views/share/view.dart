import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../../../components/section_wrapper.dart';
import '../../../../components/text_block.dart';

class ShareView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Share',
      markdownPath: 'assets/markdowns/native_device_features/share_markdown.md',
      preview: _ShareImplementation(),
    );
  }
}

class _ShareImplementation extends StatelessWidget {
  void _onTapShare() {
    Share.share('test string');
  }

  void _onTapWhatsapp() async {
    String whatsappUrl = 'https://api.whatsapp.com/send?text=\'test string\'';

    await launchUrl(Uri.parse(whatsappUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Using \'share_plus\' package',
          content: [
            TextBlock(
              'Just import the package and use \'Share.share(\'String\')\' method.',
            ),
            TextBlock(
              'In native app mode it will open the share menu, while in web mode it will open the gmail.',
            ),
            Container(
              child: ElevatedButton(
                onPressed: _onTapShare,
                child: Text('Share'),
              ),
            ),
          ],
        ),
        SectionWrapper(
          title:
              'Using \'url_launcher\' package to share to particular app or url',
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
      ],
    );
  }
}
