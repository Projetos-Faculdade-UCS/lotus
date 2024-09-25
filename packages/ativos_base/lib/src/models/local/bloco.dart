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
