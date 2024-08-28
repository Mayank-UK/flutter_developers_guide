import 'package:flutter/material.dart';

class ContentGroupWrapper extends StatelessWidget {
  final String title;
  final List<Widget> content;

  ContentGroupWrapper({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        runSpacing: 4,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Text(
              this.title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ),
          ...this.content,
        ],
      ),
    );
  }
}
