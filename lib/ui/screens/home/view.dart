import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_developers_guide/ui/components/links.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/navigation/top_level_destinations.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) {
          return;
        }
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: const Text('Are you sure you want to exit?'),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text('No'),
                    onPressed: () {
                      context.pop(false);
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Yes, exit'),
                    onPressed: () {
                      context.pop(true);
                    },
                  ),
                ],
              );
            });

        if (value == true) {
          SystemNavigator.pop();
        }
      },
      child: PageScaffold(
        title: "Flutter developer's guide",
        mobileUi: [
          Links(itemList: topLevelDestinations),
        ],
      ),
    );
  }
}
