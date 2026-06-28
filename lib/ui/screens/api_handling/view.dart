import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/code_preview_tabs.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/section_wrapper.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';

class ApiHandlingView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/api_handling/api_handling_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'API handling',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _ApiHandlingImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _ApiHandlingImplementation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Model',
          content: [
            TextBlock(
              'A Model represents business data used by the application. Models are usually consumed by the UI, ViewModels, Cubits, and UseCases.',
            ),
            TextBlock(
              'Models should be independent of APIs, databases, and external data sources.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'DTO (Data Transfer Object)',
          content: [
            TextBlock(
              'DTOs represent data as it is received from APIs or stored in databases.',
            ),
            TextBlock(
              'DTOs are responsible for serialization and deserialization operations such as converting JSON into Dart objects and vice versa.',
            ),
            TextBlock(
              'DTOs are often converted into Models before being used by the rest of the application.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'DAO (Data Access Object)',
          content: [
            TextBlock(
              'DAO classes are responsible for direct database operations.',
            ),
            TextBlock(
              'They contain queries, inserts, updates, and delete operations for local storage solutions such as SQLite, Hive, Isar, or ObjectBox.',
            ),
            TextBlock(
              'DAO classes typically work with DTOs rather than Models.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'Data Sources',
          content: [
            TextBlock(
              'Data Sources provide data from a specific source.',
            ),
            TextBlock(
              'RemoteDataSource communicates with APIs through feature-specific clients.',
            ),
            TextBlock(
              'LocalDataSource communicates with local storage through DAOs.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'Repository',
          content: [
            TextBlock(
              'Repositories act as the single source of truth for the rest of the application.',
            ),
            TextBlock(
              'The repository hides implementation details and decides whether data should come from remote APIs, local cache, or other sources.',
            ),
            TextBlock(
              'The UI and business logic layers do not need to know where the data originates from.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'Repository Implementation',
          content: [
            TextBlock(
              'Repository interfaces define contracts while RepositoryImpl classes provide the actual implementation.',
            ),
            TextBlock(
              'Repository implementations usually coordinate RemoteDataSource and LocalDataSource, perform DTO-to-Model conversions, and handle caching strategies.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'Use Cases',
          content: [
            TextBlock(
              'Use Cases represent business actions that the application can perform.',
            ),
            TextBlock(
              'Examples include LoginUser, GetPosts, UpdateProfile, CreateOrder, and TransferMoney.',
            ),
            TextBlock(
              'They contain business rules and orchestrate interactions with repositories.',
            ),
          ],
        ),
        SectionWrapper(
          title: 'Typical Data Flow',
          content: [
            TextBlock(
              'UI → Cubit/Bloc → UseCase → Repository → RepositoryImpl → RemoteDataSource/LocalDataSource → DTO → Model → UI',
            ),
            TextBlock(
              'This separation helps keep UI, business logic, networking, and storage concerns independent from each other.',
            ),
          ],
        ),
      ],
    );
  }
}
