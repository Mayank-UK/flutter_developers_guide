import 'package:flutter/material.dart';

class TextBlock extends StatelessWidget {
  final String text;

  TextBlock(
    this.text,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        this.text,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
    );
  }
}
