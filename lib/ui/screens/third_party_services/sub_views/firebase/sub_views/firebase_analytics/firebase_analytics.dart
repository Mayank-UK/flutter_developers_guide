import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

class FirebaseAnalyticsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Firebase Database',
      markdownPath: 'assets/markdowns/third_party_services/firebase.md',
      preview: const _FirebaseAnalyticsImplementation(),
    );
  }
}

class _FirebaseAnalyticsImplementation extends StatelessWidget {
  const _FirebaseAnalyticsImplementation();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      child: Text('Firebase Analytics'),
    );
  }
}
