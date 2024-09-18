/// Modelo de ativo de TI.
class Ativo {
  /// Cria um ativo de TI.
  Ativo({
    required this.nome,
    required this.tipo,
    required this.patrimonio,
    required this.ultimaAtualizacao,
  });

  /// Nome do ativo.
  final String nome;

  /// Patrimônio fiscal do ativo.
  final int patrimonio;

  /// Data da última atualização.
  final DateTime ultimaAtualizacao;

  /// Tipo do ativo.
  final TipoAtivo tipo;

  /// Retorna uma imagem diferente para cada tipo de ativo.
  String get imagem {
    switch (tipo) {
      case TipoAtivo.computador:
        return 'assets/ativos/computador.svg';
      case TipoAtivo.monitor:
        return 'assets/ativos/monitor.svg';
      case TipoAtivo.impressora:
        return 'assets/ativos/impressora.svg';
    }
  }
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
