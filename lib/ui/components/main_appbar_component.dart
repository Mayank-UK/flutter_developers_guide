import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/design_system/design_system.dart';

AppBar MainAppBarComponent({required String appBarTitle}) {
  return AppBar(
    title: Text(
      appBarTitle,
      style: DSTypography.h5Light,
    ),
  );
}

// class MainAppBarComponent extends StatelessWidget {
//   final String appBarTitle;

//   MainAppBarComponent({required this.appBarTitle});

//   Size get preferredSize => Size.fromHeight(kToolbarHeight);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text(
//         this.appBarTitle,
//         style: DSTypography.h5Light,
//       ),
//     );
//   }
// }
