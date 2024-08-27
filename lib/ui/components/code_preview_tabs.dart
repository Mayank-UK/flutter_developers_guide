import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';

import './../design_system/design_system.dart';

class CodePreviewTabs extends StatelessWidget {
  final String appBarTitle;
  final Widget previewTab;
  final String codeTabMarkdownLocation;

  CodePreviewTabs(
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
      child: Column(
        children: [
          TabBar(
            tabs: <Widget>[
              Tab(
                child: const Text('Preview'),
              ),
              Tab(
                child: const Text('Code'),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.84,
            child: TabBarView(
              physics: AlwaysScrollableScrollPhysics(),
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
        ],
      ),
    );
  }
}
