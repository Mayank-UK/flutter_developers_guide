## using Theme widget
    Wrap(
        runSpacing: 8,
        spacing: 8,
        children: <Widget>[
        Wrap(
            direction: Axis.vertical,
            runSpacing: 8,
            spacing: 8,
            children: <Widget>[
                Text(
                    'Default',
                ),
                FloatingActionButton(
                    onPressed: () {},
                    child: Icon(Icons.add),
                ),
            ],
        ),
        Wrap(
            direction: Axis.vertical,
            runSpacing: 8,
            spacing: 8,
            children: <Widget>[
                Text(
                    'Themed',
                ),
                Theme(
                    data: ThemeData(
                    accentColor: Colors.yellow,
                    ),
                    child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.add),
                    ),
                ),
            ],
        ),
        ],
    ),

## using MaterialApp/CupertinoApp widget
    MaterialApp(
        title: 'Flutter fundamentals',
        theme: ThemeData(
                brightness: Brightness.dark,
                primaryColor: Colors.blue,
                accentColor: Colors.red,
                fontFamily: 'Montserrat',
        ),
        home: Scaffold(
            appBar: AppBar(),
            body: Text('body'),
        ),
    );