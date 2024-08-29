import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';

import '../../components/section_wrapper.dart';
import '../../components/content_group_wrapper.dart';

class BestPracticesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Best practices",
      mobileUi: [
        SectionWrapper(
          title: 'Technical',
          content: [
            ContentGroupWrapper(
              title: 'Controlling build() cost',
              content: [
                TextBlock(
                  'Avoid repetitive and costly work in build() method.',
                ),
                TextBlock(
                  'Avoid large single widgets with a large build() method, refactor and split into different small widgets to optimize performance.',
                ),
                TextBlock(
                  'For widgets that don\'t change when the state changes, declare them as constants, this will prevent save build time.',
                ),
              ],
            ),
            ContentGroupWrapper(
              title: 'Apply effects only when needed (avoid saveLayer())',
              content: [
                TextBlock(
                  'Use opacity only when necessary, prefer using other things like transparent images, etc.',
                ),
                TextBlock(
                  'Clipping is not as expensive but still costly , prefer using borderRadius',
                ),
                TextBlock(
                  'Avoid using effects with animations, instead use animation properties to achieve the same effect.',
                ),
              ],
            ),
            TextBlock(
              'Render grids and lists lazily.',
            ),
            TextBlock(
              'When using AnimatedBuilder, avoid putting a subtree in the builder function that builds widgets that don\'t depend on the animations, this subtree is rebuild for every tick, instead build it once and pass it as a child to the AnimatedBuilder.',
            ),
            TextBlock(
              'Avoid using constructors with a concrete list of children such as Column() or ListView().',
            ),
            TextBlock(
              'Specify types for class members, avoid using var when possible.',
            ),
            TextBlock(
              'Avoid using "new" and "this" keyword, it makes code look cluttered and verbose.',
            ),
            TextBlock(
              'Handle errors using custom error screens.',
            ),
            TextBlock(
              'Separate UI from logic.',
            ),
            TextBlock(
              'Single responsibility of a single widget.',
            ),
            TextBlock(
              'Use a design system.',
            ),
            TextBlock(
              'Use an architecture pattern for codebase like MVVM.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'Naming convention',
          content: [
            TextBlock(
              'Classes, enums, typedefs and extensions name should be in UpperCamelCase.',
            ),
            TextBlock(
              'Libraries, packages, directories and file names should be in snake_case.',
            ),
            TextBlock(
              'Variables, constants, parameters, and named parameters should be in lowerCamelCase.',
            ),
            TextBlock(
              'Write every tappable method name staring with "onTap...", or refresh method as "onRefresh...", etc.',
            ),
            TextBlock(
              'Write every class member name with an underscore "_" by default, which marks them as private.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'Refactoring',
          content: [
            TextBlock(
              'Refactor every page into a separate widget class. Put "SingleChildScrollView" as the root widget having "Column" as child widget and put page content inside "Column" widget.',
            ),
            TextBlock(
              'Refactor a page into different sections using methods/functions to use in build method.',
            ),
            TextBlock(
              'Separate the widgets in individual methods/functions including their wrappers which will be used to specify their margin/padding/position.',
            ),
            TextBlock(
              'Put the lifecycle methods at top, then non widget methods, then widget methods and at last build method.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'Tools',
          content: [
            ContentGroupWrapper(
              title: 'IDE (flutter and dart plugins)',
              content: [
                TextBlock(
                  'Use auto formatter.',
                ),
                TextBlock(
                  'Add or remove widget using right click context menu->refactor->add/remove widget.',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
