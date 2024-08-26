## using Container widget
    Container(
        color: Colors.amber,
        padding: EdgeInsets.all(8),
        child: const Text('Padding of 8'),
    ),

## using Padding widget
    Container(
        color: Colors.amber,
        child: Padding(
            padding: EdgeInsets.all(8),
            child: Container(
                child: const Text('Padding of 8'),
            ),
        ),
    ),