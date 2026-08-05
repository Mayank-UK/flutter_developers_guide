import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class FlowWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'Flow',
      markdownPath: 'assets/markdowns/widget_catalog/layout/flow_markdown.md',
      preview: _FlowWidgetImplementation(),
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
              'Flow is a low-level layout widget that gives its children to a FlowDelegate you write. The delegate\'s paintChildren receives a FlowPaintingContext and is free to position, transform, and paint each child however it likes — including using a matrix per child and reacting to an Animation for repositioning.',
            ),
            TextBlock(
              'It is dramatically more efficient than stacking many Positioned/Transform widgets when you have a lot of children, because Flow lays out each child once (against loose constraints) and only repaints via the cheap transform path. The trade-off is more code: Wrap, Stack, or a Column will be simpler for everyday "wrap children in rows" or "overlap a few items" needs.',
            ),
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
