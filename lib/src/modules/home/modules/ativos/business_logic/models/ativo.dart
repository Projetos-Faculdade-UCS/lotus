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

/// Enum de tipos de ativos de TI.
enum TipoAtivo {
  /// Computador.
  computador,

  /// Monitor.
  monitor,

  /// Impressora.
  impressora,

  ///Licença de software.
  ///Exemplo: Windows, Office, Photoshop.
  licencaSoftware,
}

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

/// Modelo de bloco dentro da Universidade.
class Bloco {
  /// Cria um bloco.
  Bloco({
    required this.nome,
    required this.campus,
    required this.cidade,
  });

  /// Nome do bloco.
  final String nome;

  /// Campus onde o bloco se encontra.
  /// Exemplo: Campus I, Campus II, Campus III.
  final String campus;

  /// Cidade onde o bloco se encontra.
  /// Exemplo: São Paulo, Campinas, Ribeirão Preto.
  final String cidade;
}
