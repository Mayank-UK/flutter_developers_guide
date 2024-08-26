## using Stack widget with Positioned widget
    Container(
        color: Colors.amber,
        height: 300,
        width: double.infinity,
        child: Stack(
        children: <Widget>[
            Positioned(
            bottom: 20,
            left: 20,
            child: Container(
                color: Colors.red,
                height: 100,
                width: 100,
            ),
            ),
            Positioned(
                top: 20,
                right: 20,
                child: Container(
                color: Colors.red,
                height: 100,
                width: 100,
                )),
        ],
        ),
    ),