import 'package:flutter/material.dart';

class PageNotFoundView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('404 error'),
        ),
        body: const Text('Page not found screen'));
  }
}
