## using Container widget
    Container(
        alignment: Alignment.center,
        color: Colors.amber,
        height: 100,
        width: 100,
        child: const Text('Container'),
    ),

## using SizedBox widget
    SizedBox(
        height: 100,
        width: 100,
        child: Container(
            alignment: Alignment.center,
            color: Colors.amber,
            child: const Text('SizedBox'),
        ),
    )