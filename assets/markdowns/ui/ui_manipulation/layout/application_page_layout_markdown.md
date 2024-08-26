## using MaterialApp widget at root
    MaterialApp(
      title: 'Flutter fundamentals',
      home: Scaffold(
        appBar: AppBar(),
        body: Text('body'),
      ),
    );

## using CupertinoApp widget at root
    CupertinoApp(
      title: 'Cupertino app',
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(),
        child: Text('child'),
      ),
    );