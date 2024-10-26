import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:repositories/repositories.dart';

/// {@template tipo_criticidade_badge}
/// Badge que exibe o tipo de criticidade.
/// {@endtemplate}
class TipoCriticidadeBadge extends StatelessWidget {
  /// {@macro tipo_criticidade_badge}
  const TipoCriticidadeBadge({
    required this.criticidade,
    super.key,
  });

  /// A criticidade dos dados.
  final CriticidadeDados criticidade;

  @override
  Widget build(BuildContext context) {
    return CustomBadge(
      label: Text(criticidade.name),
      backgroundColor: Colors.transparent,
      borderColor: Color(criticidade.color),
      textStyle: TextStyle(
        color: Color(criticidade.color),
        fontSize: 12,
      ),
    );
  }
}
