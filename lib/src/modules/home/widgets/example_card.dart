import 'package:flutter/material.dart';

/// An example card widget.
class ExampleCard extends StatelessWidget {
  /// Creates an example card widget.
  const ExampleCard({
    required this.title,
    required this.subtitle,
    super.key,
  });

  /// The title widget.
  final Widget title;

  /// The subtitle widget.
  final Widget subtitle;

  void _onTap() {
    print('Card tapped!');
    // Modular.to.navigate('/computadores/2');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 200,
      child: Card(
        surfaceTintColor: Colors.black,
        child: InkWell(
          onTap: _onTap,
          borderRadius: BorderRadius.circular(10),
          onSecondaryTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.titleLarge!,
                  child: title,
                ),
                subtitle,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
