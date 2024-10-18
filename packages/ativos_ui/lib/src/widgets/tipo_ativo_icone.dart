import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:repositories/repositories.dart';

/// Ícone de um tipo de ativo de TI.
class TipoAtivoIcone extends StatelessWidget {
  /// Cria um ícone de um tipo de ativo de TI.
  const TipoAtivoIcone({
    required this.tipo,
    this.size = 50,
    super.key,
  });

  /// Tipo de ativo.
  final TipoAtivo tipo;

  /// Size of the icon.
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        tipo.icon,
        width: size,
        height: size,
      ),
    );
  }
}
