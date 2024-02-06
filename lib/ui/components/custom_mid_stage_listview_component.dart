import 'package:flutter/material.dart';

import 'package:flutter_developers_guide/ui/design_system/design_system.dart';

class ListViewItem {
  final String title;
  final String description;
  final String route;

  ListViewItem(
      {required this.title, required this.description, required this.route});
}

class CustomMidStageListViewComponent extends StatelessWidget {
  final List<ListViewItem> itemList;

  CustomMidStageListViewComponent({required this.itemList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: DSSpacing.sm),
      child: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                itemList[index].route,
                arguments: {'appBarTitle': '${itemList[index].title}'},
              );
            },
            child: Container(
              margin: const EdgeInsets.only(
                top: DSSpacing.sm,
                right: DSSpacing.sm,
                left: DSSpacing.sm,
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: DSColors.SecondaryGradient,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    DSShadows.buttonCard,
                  ],
                ),
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: 140,
                  ),
                  padding: EdgeInsets.all(DSSpacing.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        itemList[index].title,
                        style: DSTypography.h6Light,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: DSSpacing.sm,
                        ),
                        child: Text(
                          itemList[index].description,
                          style: DSTypography.body1Light,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
