## using Icon widget
    Icon(
        Icons.favorite,
        size: 32,
    ),

## using Image widget
### network image using NetworkImage class
    Image(
        height: 100,
        width: 100,
        image: NetworkImage(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
    ),

### asset image using AssetImage class
    Image(
        height: 100,
        width: 100,
        image: AssetImage('assets/images/demo.jpeg'),
    ),