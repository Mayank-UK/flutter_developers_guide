import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_developers_guide/ui/components/code_preview_tabs.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/section_wrapper.dart';
import 'package:flutter_developers_guide/ui/components/text_block.dart';

class NativeBridgingView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/other_basics/native_bridging_markdown.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Native bridging',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _NativeBridgingImplementation(),
          codeTabMarkdownLocation: this._codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _NativeBridgingImplementation extends StatefulWidget {
  const _NativeBridgingImplementation({super.key});

  @override
  State<_NativeBridgingImplementation> createState() =>
      __NativeBridgingImplementationState();
}

class __NativeBridgingImplementationState
    extends State<_NativeBridgingImplementation> {
  static const MethodChannel _channel = MethodChannel('com.example/native');
  String _nativeData = '';
  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> _getNativeData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });
    try {
      final String data = await _channel.invokeMethod('getNativeData');
      setState(() {
        _nativeData = data;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error calling native method: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapper(
          title: 'Basics',
          content: [
            TextBlock(
              "Communicate with native platform functionalities using Flutter.",
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: _getNativeData,
                  child: Text('Fetch Native Data'),
                ),
                SizedBox(height: 20),
                if (_isLoading)
                  Center(
                    child: CircularProgressIndicator(),
                  )
                else if (_errorMessage.isNotEmpty)
                  Center(
                    child: Text(_errorMessage),
                  )
                else if (_nativeData.isNotEmpty)
                  Center(
                    child: Text('$_nativeData'),
                  )
                else
                  Center(
                    child: Text('_'),
                  ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
