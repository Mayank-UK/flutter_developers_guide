import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class FlowWidgetView extends StatelessWidget {
  final String _appBarTitle = 'Flow';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/widget_catalog/layout/flow_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: _appBarTitle,
      children: [
        CodePreviewTabs(
          appBarTitle: this._appBarTitle,
          previewTab: _FlowWidgetImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _FlowWidgetImplementation extends StatefulWidget {
  @override
  __FlowWidgetImplementationState createState() =>
      __FlowWidgetImplementationState();
}

class __FlowWidgetImplementationState extends State<_FlowWidgetImplementation>
    with SingleTickerProviderStateMixin {
  late AnimationController menuAnimation;
  IconData lastTapped = Icons.notifications;
  final List<IconData> menuItems = <IconData>[
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];

  void _updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      setState(() => lastTapped = icon);
    }
  }

  @override
  void initState() {
    super.initState();
    menuAnimation = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
  }

  Widget flowMenuItem(IconData icon) {
    final double buttonDiameter = 64;
    return Container(
      child: RawMaterialButton(
        fillColor: lastTapped == icon ? Colors.amber[700] : Colors.blue,
        splashColor: Colors.amber,
        shape: const CircleBorder(),
        constraints: BoxConstraints.tight(
          Size(
            buttonDiameter,
            buttonDiameter,
          ),
        ),
        onPressed: () {
          _updateMenu(icon);
          menuAnimation.status == AnimationStatus.completed
              ? menuAnimation.reverse()
              : menuAnimation.forward();
        },
        child: Icon(
          icon,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
                '"Flow" widget has named parameter delegate, which takes the delegate and define the flow menu.'),
            Container(
              height: 100,
              child: Flow(
                delegate: FlowMenuDelegate(menuAnimation: menuAnimation),
                children: menuItems
                    .map<Widget>(
                      (IconData icon) => flowMenuItem(icon),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({
    required this.menuAnimation,
  }) : super(repaint: menuAnimation);

  final Animation<double> menuAnimation;

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    double dx = 0.0;
    for (int i = 0; i < context.childCount; ++i) {
      dx = context.getChildSize(i)!.width * i;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          dx * menuAnimation.value,
          0,
          0,
        ),
      );
    }
  }
}
