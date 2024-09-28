// ignore_for_file: prefer_const_constructors
import 'package:ativos_base/ativos_base.dart';
import 'package:test/test.dart';

void main() {
  group('Ativo', () {
    test('can be instantiated', () {
      expect(
        Ativo(
          nome: 'nome',
          tipo: TipoAtivo.computador,
          patrimonio: 1,
          ultimaAtualizacao: DateTime.now(),
          automatico: true,
          emUso: true,
          sala: Sala(
            nome: 'nome',
            bloco: Bloco(
              nome: 'nome',
              campus: 'nome',
              cidade: 'nome',
            ),
          ),
        ),
        isNotNull,
      );
    });
  });
}
