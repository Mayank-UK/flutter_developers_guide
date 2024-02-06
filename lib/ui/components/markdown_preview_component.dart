import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_developers_guide/ui/design_system/design_system.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownPreviewComponent extends StatelessWidget {
  String markdownLocation;

  MarkdownPreviewComponent({required this.markdownLocation});

  Future<String> getFileData(String path) async {
    return await rootBundle.loadString(path);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DSColors.BackgroundBodyDark,
      height: 400,
      child: FutureBuilder(
        future: getFileData(this.markdownLocation),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text(
              'Loading Markdown Info...',
              style: DSTypography.body1Dark,
            );
          }
          return Markdown(data: snapshot.data.toString());
        },
      ),
    );
  }
}
