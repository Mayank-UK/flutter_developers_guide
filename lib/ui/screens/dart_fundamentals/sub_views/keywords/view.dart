import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

import '../../../../components/section_wrapper.dart';
import '../../../../components/content_group_wrapper.dart';
import '../../../../components/text_block.dart';

class KeywordsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Keywords",
      children: [
        SectionWrapper(
          title: 'Keywords',
          content: [
            TextBlock(
              'Keywords are the words which have special meaning in a language.',
            ),
            ContentGroupWrapper(
              title: 'Keyword list',
              content: [
                TextBlock(
                  'abstract\nas\nassert\nasync\nawait\nbreak\ncase\ncatch\nclass\nconst\ncontinue\ncovariant\ndefault\ndeferred\ndo\ndynamic\nelse\nenum\nexport\nextends\nextension\nexternal\nfactory\nfalse\nfinal\nfinally\nfor\nFunction\nget\nget\nhide\nimplements\nimport\nin\ninterface\nis\nlibrary\nmixin\nnew\nnull\non\noperator\npart\nrethrow\nreturn\nset\nshow\nstatic\nsuper\nswitch\nasync\nthis\nthrow\ntrue\ntry\ntypedef\nvar\nvoid\nwhile\nwith\nyield',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
