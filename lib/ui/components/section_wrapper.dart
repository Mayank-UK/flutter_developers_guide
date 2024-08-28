import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/design_system/sizes.dart';

class SectionWrapper extends StatelessWidget {
  final String title;
  final List<Widget> content;

  SectionWrapper({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceTint,
      margin: const EdgeInsets.only(bottom: DSSizes.md),
      padding: const EdgeInsets.all(DSSizes.md),
      width: double.infinity,
      child: Wrap(
        runSpacing: 16,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              bottom: DSSizes.md,
            ),
            width: double.infinity,
            child: Text(
              this.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
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
