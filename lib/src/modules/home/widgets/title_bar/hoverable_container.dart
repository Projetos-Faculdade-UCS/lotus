import 'package:flutter/material.dart';

/// A container that changes its decoration based on the widget state.
class HoverableContainer extends StatefulWidget {
  /// Default constructor.
  const HoverableContainer({
    required this.child,
    super.key,
    this.onTap,
    this.decoration,
  });

  /// The child widget.
  final Widget child;

  /// The callback to be called when the widget is tapped.
  final VoidCallback? onTap;

  /// The decoration to be used when the widget is in a certain state.
  final WidgetStateProperty<BoxDecoration>? decoration;

  @override
  State<HoverableContainer> createState() => _HoverableContainerState();
}

class _HoverableContainerState extends State<HoverableContainer> {
  final Set<WidgetState> _states = <WidgetState>{};

  void _updateState(WidgetState state, bool value) {
    setState(() {
      if (value) {
        _states.add(state);
      } else {
        _states.remove(state);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final decoration = widget.decoration?.resolve(_states);

    return MouseRegion(
      onEnter: (_) => _updateState(WidgetState.hovered, true),
      onExit: (_) => _updateState(WidgetState.hovered, false),
      child: GestureDetector(
        onTapDown: (_) => _updateState(WidgetState.pressed, true),
        onTapUp: (_) => _updateState(WidgetState.pressed, false),
        onTapCancel: () => _updateState(WidgetState.pressed, false),
        onTap: widget.onTap,
        child: Container(
          decoration: decoration,
          child: widget.child,
        ),
      ),
    );
  }
}
