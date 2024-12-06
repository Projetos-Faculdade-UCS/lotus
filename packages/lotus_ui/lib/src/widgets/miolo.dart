import 'package:flutter/material.dart';

/// The widget that represents the main content of the application.
class Miolo extends StatelessWidget {
  /// The widget that represents the main content of the application.
  const Miolo({
    required this.child,
    super.key,
    this.appBar,
    this.padding = EdgeInsets.zero,
  });

  /// Child widget that will be displayed in the main content.
  final Widget child;

  /// Padding of the main content.
  final EdgeInsetsGeometry padding;

  /// The app bar of the application.
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ColoredBox(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            if (appBar != null) appBar!,
            Expanded(
              child: Padding(
                padding: padding,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
