import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';

import 'code_block.dart';

/// Renders a live [previewTab] followed by a collapsible code section that
/// loads its source from [codeTabMarkdownLocation].
///
/// Despite its historical name (formerly a two-tab TabBar/TabBarView), this
/// widget no longer uses tabs: the preview is always visible and the code is
/// revealed on demand via [CodeBlock]. The constructor signature is
/// preserved so existing call sites remain unchanged.
class CodePreviewTabs extends StatelessWidget {
  final Widget previewTab;
  final String codeTabMarkdownLocation;

  const CodePreviewTabs({
    super.key,
    required this.previewTab,
    required this.codeTabMarkdownLocation,
  });

  Future<String> _loadMarkdown(String path) {
    return rootBundle.loadString(path);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          previewTab,
          const SizedBox(height: 16),
          FutureBuilder<String>(
            future: _loadMarkdown(codeTabMarkdownLocation),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Loading code...',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              }
              final source = snapshot.data ?? '';
              return CodeBlock(
                code: source,
                language: 'dart',
                body: Markdown(
                  data: source,
                  padding: const EdgeInsets.all(16),
                  selectable: true,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
