import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:repositories/repositories.dart';

/// Ícone de um tipo de ativo de TI.
class TipoAtivoIcone extends StatelessWidget {
  /// Cria um ícone de um tipo de ativo de TI.
  const TipoAtivoIcone({
    required this.tipo,
    super.key,
  });

  /// Tipo de ativo.
  final TipoAtivo tipo;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        tipo.icon,
        width: 50,
      ),
    );
  }
}
