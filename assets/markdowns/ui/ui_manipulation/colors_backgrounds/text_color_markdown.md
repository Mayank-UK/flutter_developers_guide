## particular text element color using Text widget
    Text(
        'Text',
        style: TextStyle(
            color: Colors.red,
            fontSize: 20,
        ),
    ),

## whole section text color using DefaultTextStyle widget
    DefaultTextStyle(
        style: TextStyle(
            color: Colors.red,
            fontSize: 20,
        ),
        child: Text(
            'Text',
        ),
    ),

## whole application text color using MaterialApp widget
    MaterialApp(
        theme: ThemeData(
            textTheme: TextTheme(
                bodyText1: TextStyle(),
                bodyText2: TextStyle(),
            ).apply(
                bodyColor: Colors.orange,
                displayColor: Colors.blue,
            ),
        ),
    ),