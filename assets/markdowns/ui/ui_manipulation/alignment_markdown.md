## using parent Container widget
    Container(
        alignment: Alignment.topLeft,
        color: Colors.amber,
        height: 128,
        margin: EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.all(8),
        child: Container(
        color: Colors.red,
        padding: EdgeInsets.all(16),
        child: const Text('Text'),
        ),
    ),
    Container(
        alignment: Alignment.center,
        color: Colors.amber,
        height: 128,
        margin: EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.all(8),
        child: Container(
        color: Colors.red,
        padding: EdgeInsets.all(16),
        child: const Text('Text'),
        ),
    ),
    Container(
        alignment: Alignment.bottomRight,
        color: Colors.amber,
        height: 128,
        margin: EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.all(8),
        child: Container(
        color: Colors.red,
        padding: EdgeInsets.all(16),
        child: const Text('Text'),
        ),
    ),

## using Align widget
    Wrap(
        children: <Widget>[
            Align(
            alignment: Alignment.topLeft,
            child: Container(
                color: Colors.red,
                padding: EdgeInsets.all(16),
                child: const Text('Text'),
            ),
            ),
            Align(
            alignment: Alignment.center,
            child: Container(
                color: Colors.red,
                padding: EdgeInsets.all(16),
                child: const Text('Text'),
            ),
            ),
            Align(
            alignment: Alignment.bottomRight,
            child: Container(
                color: Colors.red,
                padding: EdgeInsets.all(16),
                child: const Text('Text'),
            ),
            ),
        ],
    ),