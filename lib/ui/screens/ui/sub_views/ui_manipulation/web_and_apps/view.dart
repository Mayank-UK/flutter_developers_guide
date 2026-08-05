import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../components/code_preview_tabs.dart';
import '../../../../../components/section_wrapper.dart';

class WebAndAppsView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/ui/ui_manipulation/web_and_apps_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Web & apps',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _WebAndAppsImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _WebAndAppsImplementation extends StatelessWidget {
  void _onTapWhatsapp() async {
    String whatsappUrl = 'https://api.whatsapp.com/send?text=\'test string\'';

    if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
      await launchUrl(Uri.parse(whatsappUrl));
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Hyperlinks',
          content: [
            TextBlock(
              'To open a URL outside your widget tree — web pages, mailto:, tel:, or deep links into other apps — use the "url_launcher" package. The single entry point is "launchUrl(Uri.parse(...))", guarded by an "await canLaunchUrl(...)" check.',
            ),
            TextBlock(
              'On a phone the OS picks the right handler: a WhatsApp URL opens WhatsApp if installed, otherwise the browser; on the web build the URL opens in a new browser tab. Use the "LaunchMode" enum to force in-app browser vs. external app vs. new tab.',
            ),
            Container(
              child: ElevatedButton(
                onPressed: _onTapWhatsapp,
                child: Text('Share to whatsapp'),
              ),
            ),
          ],
        ),
        SectionWrapper(
          title: 'WebView',
          content: [
            TextBlock(
              'The "webview_flutter" package embeds a real browser engine inside the app, letting you render arbitrary HTML/JS content. Create a "WebViewController", configure navigation and JavaScript mode, then mount it through a "WebViewWidget".',
            ),
            TextBlock(
              'Use it for third-party content you don\'t control (OAuth flows, payment pages, terms of service) rather than as a shortcut to avoid building native UI. Configure a "NavigationDelegate" to block or intercept requests and to show a loading indicator.',
            ),
            SizedBox(
              height: 512,
              child: WebViewExample(),
            ),
          ],
        ),
        SectionWrapper(
          title: 'External apps',
          content: [
            TextBlock(
              'To deep-link into another app, build the right URI scheme (e.g. "whatsapp://", "tel:", "mailto:") and pass it to "launchUrl"; if the target app is installed the OS hands off to it, otherwise "canLaunchUrl" returns false and you can fall back to a store or browser URL.',
            ),
            TextBlock(
              'Tip: iOS requires each scheme you want to query to be listed under "LSApplicationQueriesSchemes" in "Info.plist", and Android requires matching "<queries>" entries in "AndroidManifest.xml". Without these declarations "canLaunchUrl" silently returns false.',
            ),
          ],
        ),
      ],
    );
  }
}

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
              _isLoading = false;
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
