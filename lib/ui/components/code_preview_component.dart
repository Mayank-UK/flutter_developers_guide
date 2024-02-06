import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';

import './../design_system/design_system.dart';

class CodePreviewTabsComponent extends StatelessWidget {
  final String appBarTitle;
  final Widget previewTab;
  final String codeTabMarkdownLocation;

  CodePreviewTabsComponent(
      {required this.appBarTitle,
      required this.previewTab,
      required this.codeTabMarkdownLocation});

  Future<String> getFileData(String path) async {
    return await rootBundle.loadString(path);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.appBarTitle, style: DSTypography.h5Light),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: const Text('Preview'),
              ),
              Tab(
                child: const Text('Code'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: this.previewTab,
            ),
            FutureBuilder(
              future: getFileData(this.codeTabMarkdownLocation),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text(
                    'Loading Markdown Info...',
                    style: DSTypography.body1Dark,
                  );
                }
                return Markdown(data: snapshot.data.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
