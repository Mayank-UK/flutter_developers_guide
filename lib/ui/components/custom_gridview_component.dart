import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/design_system/design_system.dart';

class GridViewItem {
  final String title;
  final String route;

  GridViewItem({required this.title, required this.route});
}

class CustomGridViewComponent extends StatelessWidget {
  final List<GridViewItem> gridList;

  CustomGridViewComponent({required this.gridList});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // without this property, GridView is not visible
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.all(DSSpacing.sm),
      crossAxisSpacing: DSSpacing.sm,
      mainAxisSpacing: DSSpacing.sm,
      crossAxisCount: 2,
      children: gridList.map((item) {
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              item.route,
            );
          },
          child: Ink(
            decoration: BoxDecoration(
              gradient: DSColors.SecondaryGradient,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                DSShadows.buttonCard,
              ],
            ),
            child: Container(
              padding: EdgeInsets.all(DSSpacing.sm),
              child: Text(
                item.title,
                style: DSTypography.h6Light,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
