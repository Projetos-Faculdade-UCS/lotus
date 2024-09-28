import 'package:ativos_base/ativos_base.dart';

/// Modelo de sala de aula ou setor dentro da Universidade.
class Sala {
  /// Cria uma sala de aula ou setor.
  Sala({
    required this.nome,
    required this.bloco,
  });

  /// Nome da sala de aula ou setor.
  final String nome;

  /// Bloco onde a sala de aula ou setor se encontra.
  final Bloco bloco;
}
