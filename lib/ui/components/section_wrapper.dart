import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/design_system/sizes.dart';

/// A titled group of widgets rendered in a [Wrap].
///
/// Parameters reproduce the historical looks of the now-merged
/// [SectionWrapper] (the defaults) and `ContentGroupWrapper` (pass
/// `tinted: false`, `runSpacing: 4`, and a `bodyLarge` [titleStyle]).
class SectionWrapper extends StatelessWidget {
  final String title;
  final List<Widget> content;
  final bool tinted;
  final TextStyle? titleStyle;
  final double runSpacing;

  const SectionWrapper({
    super.key,
    required this.title,
    required this.content,
    this.tinted = true,
    this.titleStyle,
    this.runSpacing = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: tinted ? Theme.of(context).colorScheme.surfaceTint : null,
      margin: const EdgeInsets.only(bottom: DSSizes.md),
      padding: const EdgeInsets.all(DSSizes.md),
      width: double.infinity,
      child: Wrap(
        runSpacing: runSpacing,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              bottom: DSSizes.md,
            ),
            width: double.infinity,
            child: Text(
              title,
              style: (titleStyle ?? Theme.of(context).textTheme.titleLarge)
                  ?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          ...content,
        ],
      ),
    );
  }
}
