import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownPreview extends StatelessWidget {
  String markdownLocation;

  MarkdownPreview({required this.markdownLocation});

  Future<String> getFileData(String path) async {
    return await rootBundle.loadString(path);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      height: 400,
      child: FutureBuilder(
        future: getFileData(this.markdownLocation),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text(
              'Loading Markdown Info...',
              // style: DSTypography.body1Dark,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            );
          }
          return Markdown(data: snapshot.data.toString());
        },
      ),
    );
  }
}
