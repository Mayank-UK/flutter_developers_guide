 ## using Container widget
    Wrap(
        spacing: 8,
        children: <Widget>[
            Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.blueAccent,
                    width: 2,
                ),
                ),
                child: Text("Text"),
            ),
            Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                    color: Colors.blueAccent,
                    width: 3.0,
                    ),
                    right: BorderSide(
                    color: Colors.blueAccent,
                    width: 3.0,
                    ),
                ),
                ),
                child: Text("Text"),
            ),
            Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.blueAccent,
                    width: 2,
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(8),
                ),
                ),
                child: Text("Text"),
            ),
        ],
    ),

## using DecoratedBox widget
    DecoratedBox(
        decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        ),
        child: Container(
        padding: EdgeInsets.all(8),
        child: const Text('Text'),
        ),
    ),