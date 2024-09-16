/// Modelo de ativo de TI.
class Ativo {
  /// Cria um ativo de TI.
  Ativo({
    required this.nome,
    required this.tipo,
  });

  /// Nome do ativo.
  final String nome;

  /// Tipo do ativo.
  final TipoAtivo tipo;
}

/// Enum de tipos de ativos de TI.
enum TipoAtivo {
  /// Computador.
  computador,

  /// Monitor.
  monitor,

  /// Impressora.
  impressora,
}
