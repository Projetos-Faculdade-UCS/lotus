import 'package:flutter/material.dart';

/// Badge do atributo automático do ativo.
class CustomBadge extends StatelessWidget {
  /// Cria um badge automático.
  const CustomBadge({
    required this.backgroundColor,
    required this.label,
    super.key,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 12,
    ),
  });

  /// Cor de fundo.
  final Color backgroundColor;

  /// Rótulo.
  final Widget label;

  /// Preenchimento.
  final EdgeInsetsGeometry padding;

  /// Estilo de texto.
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: DefaultTextStyle(
        style: textStyle,
        child: label,
      ),
    );
  }
}
