import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/teaching_screen.dart';

import '../../../../../components/section_wrapper.dart';
import '../../../../../components/text_block.dart';

class SliverPersistentHeaderWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeachingScreen(
      title: 'SliverPersistentHeader',
      markdownPath: 'assets/markdowns/widget_catalog/layout/sliver_persistent_header_markdown.md',
      preview: _SliverPersistentHeaderWidgetImplementation(),
    );
  }
}

class _SliverPersistentHeaderWidgetImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Simple use',
          content: [
            TextBlock(
              'SliverPersistentHeader renders an arbitrary header widget as a sliver that reacts to scrolling. Unlike SliverAppBar you supply your own SliverPersistentHeaderDelegate — a small class that returns minExtent, maxExtent, and a build method — so the header content is fully custom.',
            ),
            TextBlock(
              'pinned keeps the header visible (clamped to its min extent) once it would otherwise scroll away; floating makes it pop back in on a reverse scroll without scrolling to the top. The delegate\'s build receives shrinkOffset so you can fade or morph the content between minExtent and maxExtent.',
            ),
            Container(
              color: Colors.white,
              height: 500,
              padding: const EdgeInsets.all(8),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverAppBarDelegate(
                      child: PreferredSize(
                        preferredSize: Size.fromHeight(40.0),
                        child: Container(
                          color: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 8.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'SliverPersistentHeader',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverFixedExtentList(
                    itemExtent: 50.0,
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Container(
                          alignment: Alignment.center,
                          color: Colors.lightBlue[100 * (index % 9)],
                          child: Text('List Item $index'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  _SliverAppBarDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => child.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}
