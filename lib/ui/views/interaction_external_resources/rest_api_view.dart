import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

import '../../components/code_preview_component.dart';
import '../../components/section_wrapper_component_component.dart';
import '../../components/text_block_component.dart';

class RestApiView extends StatelessWidget {
  final String _appBarTitle = 'Rest API interaction';
  final String _codeTabMarkdownLocation =
      'assets/markdowns/rest_api/rest_api_markdown.md';

  @override
  Widget build(BuildContext context) {
    return CodePreviewTabsComponent(
      appBarTitle: this._appBarTitle,
      previewTab: _RestApiImplementation(),
      codeTabMarkdownLocation: this._codeTabMarkdownLocation,
    );
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class _RestApiImplementation extends StatefulWidget {
  @override
  __RestApiImplementationState createState() => __RestApiImplementationState();
}

class __RestApiImplementationState extends State<_RestApiImplementation> {
  late Future<Album> _futureAlbum;

  void _fetchData() {
    Future<Album> _fetchAlbum() async {
      final response = await http.get(
        Uri.https(
          'jsonplaceholder.typicode.com',
          'albums/1',
        ),
      );

      if (response.statusCode == 200) {
        return Album.fromJson(
          jsonDecode(response.body),
        );
      } else {
        throw Exception('Failed to load album');
      }
    }

    setState(() {
      _futureAlbum = _fetchAlbum();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SectionWrapperComponent(
          title: 'Rest API interaction',
          content: [
            TextBlockComponent(
              'Rest API interactions are done in flutter using "http" package, "async" and "convert" library.',
            ),
            TextBlockComponent(
              'Request is made to the server using a Future and response is parsed and inserted into the view.',
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.amber,
                    padding: const EdgeInsets.all(8),
                    child: FutureBuilder<Album>(
                      future: _futureAlbum,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data!.title);
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }

                        return Container(
                          constraints: BoxConstraints(minHeight: 24),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 16,
                    ),
                    child: ElevatedButton(
                      onPressed: _fetchData,
                      child: const Text('Fetch data'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
