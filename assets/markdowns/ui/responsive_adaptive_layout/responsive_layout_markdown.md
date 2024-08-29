## responsive layout component
    class ResponsiveLayout extends StatelessWidget {
        final Widget mobileLayout;
        final Widget tabletLayout;
        final Widget desktopLayout;

        ResponsiveLayout({
            required this.mobileLayout,
            required this.tabletLayout,
            required this.desktopLayout,
        });

        @override
        Widget build(BuildContext context) {
            return LayoutBuilder(
            builder: (context, constraints) {
                if (constraints.maxWidth >= 1100) {
                return desktopLayout;
                } else if (constraints.maxWidth >= 600) {
                return tabletLayout;
                } else {
                return mobileLayout;
                }
            },
            );
        }
    }

## integrating with page scaffold
    class PageScaffold extends StatelessWidget {
        // final List<Widget> children;
        List<Widget> mobileUi;
        List<Widget>? tabletUi;
        List<Widget>? desktopUi;
        final String title;
        final GlobalKey? scaffoldKey;

        PageScaffold({
            Key? key,
            required this.title,
            // required this.children,
            this.scaffoldKey,
            required this.mobileUi,
            this.tabletUi,
            this.desktopUi,
        }) : super(key: key);

        @override
        Widget build(BuildContext context) {
            return Scaffold(
            key: scaffoldKey,
            backgroundColor: Theme.of(context).colorScheme.surface,
            appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                title: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                    ),
                ),
            ),
            body: SingleChildScrollView(
                child: ResponsiveLayout(
                mobileLayout: Column(children: mobileUi!),
                tabletLayout: Column(children: (tabletUi ?? mobileUi)!),
                desktopLayout: Column(children: (desktopUi ?? mobileUi)!),
                ),
            ),
            );
        }
    }

## usage example
    @override
    Widget build(BuildContext context) {
        return PageScaffold(
        title: _appBarTitle,
        mobileUi: [
            CodePreviewTabs(
            appBarTitle: this._appBarTitle,
            previewTab: _ResponsiveLayoutImplementation(),
            codeTabMarkdownLocation: this._codeTabMarkdownLocation,
            ),
        ],
        );
    }