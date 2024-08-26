## using MediaQuery
    Container(
        alignment: Alignment.center,
        color: Colors.amber,
        height: MediaQuery.of(context).size.height * 0.10,
        width: MediaQuery.of(context).size.width * 0.75,
        child: const Text('10% height and 75% width of screen'),
    )