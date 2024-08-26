import 'package:flutter/material.dart';

import 'package:flutter_developers_guide/ui/design_system/design_system.dart';

class TextBlock extends StatelessWidget {
  final String text;
  TextStyle style;

  TextBlock(this.text, {this.style = DSTypography.body2Dark});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        this.text,
        style: this.style,
      ),
    );
  }
}
