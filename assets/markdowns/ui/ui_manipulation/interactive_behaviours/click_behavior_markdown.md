## using InkWell widget
    class _ClickBehaviorImplementation extends StatelessWidget {
        void onTap(BuildContext context) {
            final Widget snackBar =
                SnackBar(content: const Text('Click/tap registered'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

        @override
        Widget build(BuildContext context) {
            return InkWell(
                onTap: () => onTap(context),
                child: Container(
                    alignment: Alignment.center,
                    color: Colors.amber,
                    height: 50,
                    width: 50,
                    child: const Text('Click'),
                ),
            );
        }
    }

## using GestureDetector widget
    class _ClickBehaviorImplementation extends StatelessWidget {
        void onTap(BuildContext context) {
            final Widget snackBar =
                SnackBar(content: const Text('Click/tap registered'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

        @override
        Widget build(BuildContext context) {
            return GestureDetector(
                onTap: () => onTap(context),
                child: Container(
                    alignment: Alignment.center,
                    color: Colors.amber,
                    height: 50,
                    width: 50,
                    child: const Text('Click'),
                ),
            );
        }
    }

## using different button widgets
    class _ClickBehaviorImplementation extends StatelessWidget {
        void onTap(BuildContext context) {
            final Widget snackBar =
                SnackBar(content: const Text('Click/tap registered'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

        @override
        Widget build(BuildContext context) {
            return Wrap(
                direction: Axis.horizontal,
                runSpacing: 8,
                spacing: 8,
                children: <Widget>[
                    ElevatedButton(
                        onPressed: () => onTap(context),
                        child: const Text('Click'),
                    ),
                    FloatingActionButton(
                        onPressed: () => onTap(context),
                        child: const Text('Click'),
                    ),
                ],
            );     
        }
    }