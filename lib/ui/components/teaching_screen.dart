import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/code_preview_tabs.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

/// The repeated shell of a "teaching" screen: a titled [PageScaffold] whose
/// body is a single [CodePreviewTabs] showing a live [preview] widget above a
/// collapsible code section loaded from [markdownPath].
///
/// This collapses what every teaching `view.dart` duplicated by hand — a
/// `String _codeTabMarkdownLocation` field plus a `PageScaffold` wrapping a
/// `CodePreviewTabs(previewTab: ..., codeTabMarkdownLocation: ...)` — into a
/// single declarative widget. Tablet/desktop fall back to the same single
/// column (matching the prior behavior of screens that passed only `mobileUi`).
class TeachingScreen extends StatelessWidget {
  final String title;
  final String markdownPath;
  final Widget preview;

  const TeachingScreen({
    super.key,
    required this.title,
    required this.markdownPath,
    required this.preview,
  });

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: title,
      mobileUi: [
        CodePreviewTabs(
          previewTab: preview,
          codeTabMarkdownLocation: markdownPath,
        ),
      ],
    );
  }
}
