## using Container widget
    Container(
        color: Colors.amber,
        constraints: BoxConstraints(
            minHeight: 50,
            minWidth: 50,
            maxHeight: 100,
            maxWidth: 300,
        ),
        padding: EdgeInsets.all(8),
        child: Text(
            'minWidth is 50 and maxWidth is 300, \nadd or remove text from here to see effect'),
    ),

## using ConstrainedBox widget
    ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: 50,
            minWidth: 50,
            maxHeight: 100,
            maxWidth: 300,
        ),
        child: Container(
        color: Colors.amber,
        padding: EdgeInsets.all(8),
        child: Text(
            'minWidth is 50 and maxWidth is 300, \nadd or remove text from here to see effect'),
        ),
    ),