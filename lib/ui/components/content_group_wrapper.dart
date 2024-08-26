import 'package:flutter/material.dart';

import './../design_system/design_system.dart';

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
              style: DSTypography.subtitle2Dark,
            ),
          ),
          ...this.content,
        ],
      ),
    );
  }
}
