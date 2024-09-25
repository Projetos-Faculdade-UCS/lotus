import 'package:ativos_base/ativos_base.dart';

/// Modelo de ativo de TI.
class Ativo {
  /// Cria um ativo de TI.
  Ativo({
    required this.nome,
    required this.tipo,
    required this.patrimonio,
    required this.ultimaAtualizacao,
    required this.automatico,
    required this.emUso,
    required this.sala,
    this.relacionamentos = 0,
  });

  /// Nome do ativo.
  final String nome;

  /// Patrimônio fiscal do ativo.
  final int patrimonio;

  /// Data da última atualização.
  final DateTime ultimaAtualizacao;

  /// Tipo do ativo.
  final TipoAtivo tipo;

  /// Sala onde o ativo se encontra.
  final Sala? sala;

  /// Se o ativo é automático.
  final bool automatico;

  /// Se o ativo está em uso.
  final bool emUso;

  /// Quantidade de relacionamentos com outros ativos.
  final int relacionamentos;
}
