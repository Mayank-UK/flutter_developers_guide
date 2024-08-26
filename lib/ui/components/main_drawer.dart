import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/design_system/design_system.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: DSColors.PrimaryGradient,
            ),
            child: Text(
              'Flutter developers guide',
              style: DSTypography.h5Light,
            ),
          ),
          ListTile(
            leading: Icon(Icons.rate_review),
            title: const Text(
              'Rate on Google Play',
              style: DSTypography.body1Dark,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.code),
            title: const Text(
              'Source code on GitHub',
              style: DSTypography.body1Dark,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text(
              'Dark mode',
              style: DSTypography.body1Dark,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
