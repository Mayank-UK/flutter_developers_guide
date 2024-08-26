## using FractionallySizedBox widget
    FractionallySizedBox(
        heightFactor: 0.5,
        widthFactor: 0.8,
        child: Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: const Text('80% width and 50% height of parent'),
        ),
    ),

## using Expanded widget inside Row or Column widget
### inside Row widget
    Column(
        children: <Widget>[
            Expanded(
            flex: 3,
            child: Container(
                alignment: Alignment.center,
                color: Colors.amber,
                child: const Text('75% height'),
            ),
            ),
            Expanded(
            flex: 1,
            child: Container(
                alignment: Alignment.center,
                color: Colors.red,
                child: const Text('25% height'),
            ),
            ),
        ],
    ),

### inside Column widget
    Row(
        children: <Widget>[
            Expanded(
            flex: 3,
            child: Container(
                alignment: Alignment.center,
                color: Colors.amber,
                child: const Text('75% width'),
            ),
            ),
            Expanded(
            flex: 1,
            child: Container(
                alignment: Alignment.center,
                color: Colors.red,
                child: const Text('25% width'),
            ),
            ),
        ],
    ),