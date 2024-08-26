## using Container widget
    Container(
        decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(20),
        boxShadow: <BoxShadow>[
            BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 8),
            ),
        ],
        ),
        height: 100,
        width: 100,
    )

## using PhysicalModel widget
    PhysicalModel(
        color: Colors.amber,
        elevation: 8,
        shadowColor: Colors.black87,
        borderRadius: BorderRadius.circular(20),
        child: Container(
            height: 100,
            width: 100,
        ),
    ),
    