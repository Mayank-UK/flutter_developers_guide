# AI defined section:

## Current state
- Clean-architecture Flutter teaching app: domain/data/core/ui, get_it+injectable DI, BLoC (provider/riverpod are demo-only under state_management/).
  All routes live under ONE top-level ShellRoute (AppShell chrome); every one of the 290 paths is byte-identical to pre-shell.
- Theme: ThemeModeController = ValueNotifier<ThemeMode> singleton (lib/ui/services/theme_mode_controller.dart) wrapping MaterialApp.router — lightest
  fit for the mixed state stack, no new deps; in-memory only (shared_preferences NOT a dep; set() hook is the persistence drop-in). PageScaffold
  AppBar = hamburger (AppShell.appShellScaffoldKey) + ThemeToggleButton; AppShell drawer = Home + 22 destinations + About + tri-state
  system/light/dark chips (shared const lib/ui/navigation/top_level_destinations.dart; context.go replaces stack, closes itself first).
- Firebase resilience (auth-required rules): firestore.rules + storage.rules at root require request.auth != null, registered in firebase.json.
  Anonymous auth IS the demo session: AuthRemoteDataSource.ensureAnonymousSession() signs in only when no user (never downgrades a real session);
  bootstrapApp calls it after DI (failure only logged, non-fatal). Anonymous users report as null via authStateChanges() so the auth demo UI stays
  logged-out; signOut re-establishes the anonymous session. guardedStream() (guards.dart) wraps .snapshots() so FirebaseException → FirestoreFailure
  (permission-denied/unauthorized get the shared "Sign in required to access this data." message).
- Error pipeline: signOut returns Future<Result<void>> end-to-end (repo → use case → AuthBloc switches on Result); repo watchTodos/watchImages
  route upstream through guardedStream; generic catch = Failed(UnknownFailure('Unexpected error: $e')). Failure.cause is Failure? — raw exceptions
  can't enter the cause chain; they're captured by logger.severe instead.
- Fakes: old FakeApiService god-fake DELETED, split into FakeAuth/Post/Todo/ImageRemoteDataSource (one interface each, lib/data/remote/) composing
  the FakeApiSimulator mixin (ApiScenario switch: success/network/timeout/server/invalidJson + 600ms delay); injection_module registers each fake
  against its own interface when config.useFakeApi. Fake-vs-live is a COMPILE-TIME choice (AppConfig.useFakeApi) — never add a runtime fallback.
- Data hygiene: PostDAO uses an injected package:logging Logger (no print); DatabaseProvider opens SQLite behind a Completer<Database> init-guard
  (no concurrent double-open; open happens in bootstrapApp before initializeDependencies); DTO casing = Dto (TodoDto/PostDto/ImageItemDto);
  use cases grouped lib/domain/usecases/{posts,auth,todos,images}/; build_runner regenerates injection.config.dart cleanly (the "Missing
  dependencies" warnings for AppConfig/Database are expected — registered manually in injection.dart, not injectable).
- UI components: TeachingScreen(title, markdownPath, preview) (lib/ui/components/teaching_screen.dart) owns the teaching shell for 225 screens;
  SectionWrapper absorbed ContentGroupWrapper (content_group_wrapper.dart DELETED; converted call sites pass tinted: false, runSpacing: 4,
  titleStyle: bodyLarge; defaults reproduce the old look so the 253 SectionWrapper call sites stay unchanged); CodePreviewTabs keeps its public
  signature but renders the live preview first + a collapsible CodeBlock (markdown asset loaded via rootBundle, rendered with flutter_markdown —
  assets mix # headers and 4-space-indented code). MarkdownPreview (4 always-visible call sites) intentionally unchanged.
- Design system aligned with react_developers_guide: colors.dart = indigo/teal + slate surfaces + AppSeverityColors (light+dark) with
  primary/secondaryContainer* (Material 3) naming; sizes.dart radius tokens; DSShadows = List<BoxShadow> layered slate-tinted; theme.dart single
  _buildTextTheme() shared by both modes, useMaterial3: true, scaffoldBackgroundColor/dividerColor wired; fonts = Montserrat (display) + Inter
  (body, bundled) + JetBrains Mono (code/mono) — never unbundled Roboto.
- Teaching content: ALL widget_catalog + ui/ screens enriched to exception_handling depth (What / Why-when / gotcha-or-tip; batches 1–6 complete,
  placeholder junk removed). Demos migrated to current Flutter 3.44 / Dart 3.12 APIs: withValues(alpha:), PopScope + onPopInvokedWithResult,
  textScaler, onAcceptWithDetails, RadioGroup, onReorderItem, launchUrl, androidScheduleMode.exactAllowWhileIdle (highAccuracy does NOT exist in
  that plugin's enum — never use it).
- Testing: 92 tests / 10 files (guards, auth/todo/image repo impls, auth/todos/images BLoCs + the original 3). Conventions: mocktail mocks
  implement one interface each (registerFallbackValue for File/String matchers); blocTest<B,S> with seed: () => State(...) (seed is a FUNCTION
  per bloc_test 9.1.0, not a value); real Result/Failure/AppException types; behavior-over-implementation assertions.
- Analyzer/build: 8 pre-existing warnings in unrelated widget-demo code (unused_import ×3, unnecessary_null_comparison, unused_element_parameter
  ×3) — keep zero NEW issues. `flutter build apk --debug` FAILS with "No matching client found for package name …dev" (google-services.json lacks
  the dev/prod applicationId variants — pre-existing env issue, NOT caused by app code); `flutter build ios --debug --no-codesign
  --target=lib/main_dev.dart` succeeds.
- History (2026-08 read-only architecture audit, chunks A–F all applied, Firebase resilience, design alignment, code display, enrichment batches,
  deprecated-API sweep, ShellRoute/drawer/theme) → archived verbatim in devlog.md.

## Active tasks
- ⏳ Review code and refactor to take implementation to 10/10 (senior flutter review — architecture, design system, BLoC/state logic, all aspects; Developer task).
- ⏳ Firebase deploy, needs user approval: `firebase deploy --only firestore:rules,storage` + enable the Anonymous provider in Firebase Console → Authentication → Sign-in method.

# Developer defined section

- Project requirements
    - I will add my requirements to this file marked as "⏳" and you will keep finishing them and marking them "✅" on completion

- Generic instructions:
    - You have to build UI using the design system implemented in the application
    - You have to follow the proper architecture that is followed in the application, for example, having use cases, repositories, repositoriesImpl, remote, DTOs, local, DAOs, exception handling, and so on
    - You have to check if existing components can be reused instead of creating new ones. If a component is to be used in a single file, then better to make it a function inside that view. If a component is to be used in multiple files, then create it inside the global ui/components
    - If feeling confused about how to do things, you are free to check how it's done in other parts of this app; the goal is to maintain consistency throughout the app
    - You have to follow few principles to write quality code, but these are not to be forced as some technologies have their standards, for example react uses hooks and other technologies use their own standards:
        - Core programming principles:
            - DRY, KISS, YAGNI, SOLID, Separation of concerns, Single source of truth
        - Object oriented design if required
            - Encapsulation, Abstraction, Inheritance, Polymorphism, Composition over inheritance, Command query separation, Law of Demeter, Dependency Injection, Inversion of control, High cohesion, Low coupling
        - Software design
            - Modularity, Maintainability, Readibility, Extensibility, Defensive programming (input is hostile), Immutability, Pure functions, Referential Transparency, Composition, Lazy evaluation
        - Code quality
            - Self documenting (descriptive naming), Consistent formatting, Error handling
        - Concurrency
            - Thread safety, Synchronization, Immutability
        - Security
            - Least priviledge, Input validation, Secret management
        - Testing
            - Unit tests, Test behaviour not implementation
        - Refactoring
            - Incremental refactoring, remove duplication
        - Engineering principles
            - Unix philosophy (composable tools beat monoliths)
        - Performance
            - Right algorithms, Right datastructures, Caching, Batching
    - You have to follow flutter best practices:
        -
    - Keep "agentic_development.md" for this project as lean as possible without compromising it's primary purpose to high quality consistent development, optimize token efficiency and seemless development across sessions. Remove the information inside the "AI defined section" that is no longer relevant and will not be usefull in future to save tokens

- Development tasks:
    - Update design similar to React developers guide ✅
    - Need to update our Firebase implementation as Firebase has revoked open access to data, as it's been more than 30 days ⏳ (code-side resilience done; pending deploy — see AI section above)
    - Right now flutter shows code via markdown files, but it's very cumbersome, we need to show it like other apps for example react_developers_guide togglable code section ✅
    - react_developers_guide is well descriptive, but the Flutter one is not, we need to describe little more ✅ (all widget_catalog + ui/ categories enriched to exception_handling depth — batches 1–6 complete)
    - Add a drawer with about page and add toggle for light/dark mode in appbar on right side like react_developers_guide ✅
    - Review code and refactor to take implementation to 10/10 ⏳
        - Review from the perspective of a developer who has 10 years of experience in flutter and 30 years of experience in Software development, who knows all the best practices and bad practices, whose code is simple to understand yet robust
        - Review how architecture is implemented
        - Review how design system is implemented
        - Review how hook files and logic inside them are implemented, if this is even standard or just spaghetti code
        - Review all other aspects
