## using container widget
    Container(
        color: Colors.amber,
        padding: EdgeInsets.all(8),
        child: const Text('Text inside a container'),
    ),

## using row widget
    Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
            Container(
                color: Colors.amber,
                height: 50,
                margin: EdgeInsets.only(right: 8),
                width: 50,
            ),
            Container(
                color: Colors.amber,
                height: 50,
                margin: EdgeInsets.only(right: 8),
                width: 50,
            ),
            Container(
                color: Colors.amber,
                height: 50,
                margin: EdgeInsets.only(right: 8),
                width: 50,
            ),
            Container(
                color: Colors.amber,
                height: 50,
                margin: EdgeInsets.only(right: 8),
                width: 50,
            ),
            Container(
                color: Colors.amber,
                height: 50,
                margin: EdgeInsets.only(right: 8),
                width: 50,
            ),
            Container(
                color: Colors.amber,
                height: 50,
                margin: EdgeInsets.only(right: 8),
                width: 50,
            ),
            Container(
                color: Colors.amber,
                height: 50,
                margin: EdgeInsets.only(right: 8),
                width: 50,
        ),
        ],
    )

## using column widget
    Column(
        children: <Widget>[
            Container(
            color: Colors.amber,
            height: 50,
            margin: EdgeInsets.only(bottom: 8),
            width: 50,
            ),
            Container(
            color: Colors.amber,
            height: 50,
            margin: EdgeInsets.only(bottom: 8),
            width: 50,
            ),
            Container(
            color: Colors.amber,
            height: 50,
            margin: EdgeInsets.only(bottom: 8),
            width: 50,
            ),
            Container(
            color: Colors.amber,
            height: 50,
            margin: EdgeInsets.only(bottom: 8),
            width: 50,
            ),
        ],
    ),

## using wrap widget
    Wrap(
        direction: Axis.horizontal,
        runSpacing: 8,
        spacing: 8,
        children: <Widget>[
        Container(
            color: Colors.amber,
            height: 50,
            width: 50,
        ),
        Container(
            color: Colors.amber,
            height: 50,
            width: 50,
        ),
        Container(
            color: Colors.amber,
            height: 50,
            width: 50,
        ),
        Container(
            color: Colors.amber,
            height: 50,
            width: 50,
        ),
        Container(
            color: Colors.amber,
            height: 50,
            width: 50,
        ),
        Container(
            color: Colors.amber,
            height: 50,
            width: 50,
        ),
        Container(
            color: Colors.amber,
            height: 50,
            width: 50,
        ),
        ],
    );