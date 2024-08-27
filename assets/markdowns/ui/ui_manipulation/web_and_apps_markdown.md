## hyperlinks

    class _HyperlinksImplementation extends StatelessWidget {
        void _onTapWhatsapp() async {
            String whatsappUrl = 'https://api.whatsapp.com/send?text=\'test string\'';
            await launch(whatsappUrl);
        }

        @override
        Widget build(BuildContext context) {
            return Wrap(
            children: <Widget>[
                    Container(
                        child: ElevatedButton(
                            onPressed: _onTapWhatsapp,
                            child: Text('Share to whatsapp'),
                        ),
                    ),
                ],
            ),
        }
    }

## webview

    // Include all the necessary permissions in the manifest and info.plist file

    class WebViewExample extends StatefulWidget {
        @override
        _WebViewExampleState createState() => _WebViewExampleState();
    }

    class _WebViewExampleState extends State<WebViewExample> {
        late final WebViewController _controller;
        bool _isLoading = true;

        @override
        void initState() {
            super.initState();
            _initWebView();
        }

        void _initWebView() {
            _controller = WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setNavigationDelegate(
                NavigationDelegate(
                    onPageStarted: (String url) {
                        setState(() {
                            _isLoading = true;
                        });
                    },
                    onPageFinished: (String url) {
                        setState(() {
                            \_isLoading = false;
                        });
                    },
                    onWebResourceError: (WebResourceError error) {
                        print('WebView error: ${error.description}');
                    },
                ),
            )
            ..loadRequest(Uri.parse('https://google.com'))
            ..enableZoom(true);
        }

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                    title: Text("WebView Example"),
                    actions: <Widget>[
                        NavigationControls(_controller),
                    ],
                ),
                body: Stack(
                    children: [
                        WebViewWidget(controller: _controller),
                        if (_isLoading)
                        const Center(
                            child: CircularProgressIndicator(),
                        ),
                    ],
                ),
            );
        }

    }

    class NavigationControls extends StatelessWidget {
        const NavigationControls(this.controller, {Key? key}) : super(key: key);

        final WebViewController controller;

        @override
        Widget build(BuildContext context) {
            return Row(
                children: <Widget>[
                    IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () async {
                            if (await controller.canGoBack()) {
                            await controller.goBack();
                            }
                        },
                    ),
                    IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () async {
                            if (await controller.canGoForward()) {
                                await controller.goForward();
                            }
                        },
                    ),
                    IconButton(
                        icon: const Icon(Icons.replay),
                        onPressed: () {
                            controller.reload();
                        },
                    ),
                ],
            );
        }

    }
