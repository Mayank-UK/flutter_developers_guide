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
