import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotus/src/modules/home/modules/ativos/business_logic/models/ativo.dart';

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
        imagem,
        width: 50,
      ),
    );
  }

  /// Retorna uma imagem diferente para cada tipo de ativo.
  String get imagem {
    switch (tipo) {
      case TipoAtivo.computador:
        return 'assets/ativos/computador.svg';
      case TipoAtivo.monitor:
        return 'assets/ativos/monitor.svg';
      case TipoAtivo.impressora:
        return 'assets/ativos/impressora.svg';
      case TipoAtivo.licencaSoftware:
        return 'assets/ativos/licenca-software.svg';
    }
  }
}
