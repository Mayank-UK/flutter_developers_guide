import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/domain/models/link.dart';
import 'package:flutter_developers_guide/ui/design_system/shadows.dart';
import 'package:flutter_developers_guide/ui/design_system/sizes.dart';
import 'package:go_router/go_router.dart';

class Links extends StatelessWidget {
  final List<Link> itemList;

  Links({required this.itemList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: DSSizes.sm),
      child: ListView.builder(
        itemCount: itemList.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext ctxt, int index) {
          return InkWell(
            onTap: () {
              context.push(
                itemList[index].route,
                extra: {
                  'appBarTitle': itemList[index].title,
                },
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                top: DSSizes.sm,
                right: DSSizes.sm,
                left: DSSizes.sm,
              ),
              child: Ink(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    DSShadows.buttonCard,
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        itemList[index].title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                      itemList[index].description != null
                          ? Container(
                              margin: EdgeInsets.only(top: 8),
                              child: Text(
                                itemList[index].description!,
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Theme.of(context).colorScheme.onPrimary,
                                    ),
                              ),
                            )
                          : SizedBox(
                              height: 32,
                            )
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
