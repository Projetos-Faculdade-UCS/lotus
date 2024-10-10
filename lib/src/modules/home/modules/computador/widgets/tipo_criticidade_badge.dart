import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:repositories/repositories.dart';

class TipoCriticidadeBadge extends StatelessWidget {
  const TipoCriticidadeBadge({
    required this.criticidade,
    super.key,
  });

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
