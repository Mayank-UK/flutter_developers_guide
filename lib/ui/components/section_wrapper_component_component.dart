import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/design_system/design_system.dart';

class SectionWrapperComponent extends StatelessWidget {
  final String title;
  final List<Widget> content;

  SectionWrapperComponent({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DSColors.BackgroundBodyDark,
      margin: const EdgeInsets.only(bottom: DSSpacing.md),
      padding: const EdgeInsets.all(DSSpacing.md),
      width: double.infinity,
      child: Wrap(
        // direction: Axis.vertical,
        runSpacing: 16,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              bottom: DSSpacing.md,
            ),
            width: double.infinity,
            child: Text(
              this.title,
              style: DSTypography.h6Dark,
            ),
          ),
          ...this.content,
        ],
      ),
    );
  }
}
