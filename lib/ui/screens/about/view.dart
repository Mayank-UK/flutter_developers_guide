import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/section_wrapper.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';

/// About page reachable from the app drawer. Mirrors the React sister-app's
/// about entry: a short description of the project, its purpose, and the
/// tech stack in use.
class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'About',
      mobileUi: [
        SectionWrapper(
          title: 'Flutter developer\'s guide',
          content: [
            TextBlock(
              'A hands-on reference app that teaches Flutter end-to-end through '
              'live, editable widget demos and concise explanations — from Dart '
              'fundamentals and the widget catalog through state management, '
              'API/database handling, architecture, native device features, and '
              'production deployment.',
            ),
            TextBlock(
              'Each topic pairs a runnable preview with its source so you can '
              'see exactly what each widget or pattern does and how it is '
              'implemented. The app mirrors the structure of the companion '
              'React developer\'s guide.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'Tech stack',
          tinted: false,
          content: [
            TextBlock(
              '• Flutter + Material 3\n'
              '• Clean architecture: domain / data / presentation layers\n'
              '• State management: BLoC, Riverpod, Provider (each demoed in the '
              'State management section)\n'
              '• Dependency injection: get_it + injectable\n'
              '• Routing: go_router with a shared shell route\n'
              '• Firebase (Auth, Firestore, Storage, Analytics) with graceful '
              'degradation under auth-required security rules\n'
              '• Local persistence: Drift (SQLite)\n'
              '• Design system shared with the React app: Inter / Montserrat / '
              'JetBrains Mono, indigo accent, slate surfaces.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'Theme',
          tinted: false,
          content: [
            TextBlock(
              'Use the light/dark toggle in the AppBar to flip the theme, or '
              'open the navigation drawer for a system / light / dark selector. '
              'Your choice is kept in-memory for this session.',
            ),
          ],
        ),
      ],
    );
  }
}
