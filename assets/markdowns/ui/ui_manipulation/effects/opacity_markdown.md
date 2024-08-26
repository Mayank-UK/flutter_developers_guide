## using Container widget through hex code
    Container(
        alignment: Alignment.center,
        color: Color(0xFF0E3311).withOpacity(0.5),
        height: 100,
        padding: EdgeInsets.all(8),
        width: 100,
        child: Text(
        'With opacity',
        style: TextStyle(color: Colors.white),
        ),
    ),
      

## using Opacity widget
    Opacity(
        opacity: 0.5,
        child: Container(
        alignment: Alignment.center,
        color: Colors.amber,
        height: 100,
        padding: EdgeInsets.all(8),
        width: 100,
        child: const Text('With opacity'),
        ),
    ),