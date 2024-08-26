## particular element's background using Container widget
    Container(
        alignment: Alignment.center,
        color: Colors.amber,
        height: 100,
        width: 100,
        child: const Text('text'),
    ),

## whole page background using Scaffold widget
    Scaffold(
        body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.amber),
        height: 100,
        width: 100,
        child: const Text('text'),
        ),
    ),