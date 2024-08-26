## using Container widget
    Container(
        alignment: Alignment.topLeft,
        color: Colors.amber,
        height: 100,
        width: double.infinity,
        child: Container(
            color: Colors.red,
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            child: const Text('Margin of 8 from parent'),
        ),
    ),