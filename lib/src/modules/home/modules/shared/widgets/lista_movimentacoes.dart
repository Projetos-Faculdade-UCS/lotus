import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/events.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/movimentacao_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/states.dart';
import 'package:lotus/src/modules/home/modules/shared/widgets/item_movimentacao.dart';

class ListaMovimentacoes extends StatelessWidget {
  const ListaMovimentacoes({
    required this.bloc,
    required this.idAtivo,
    super.key,
  });

  final MovimentacaoBloc bloc;
  final int idAtivo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovimentacaoBloc, GenericState>(
      bloc: bloc..add(GetAllMovimentacoes(idAtivo)),
      builder: (context, state) {
        if (state is GenericInitial || state is GenericLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MovimentacoesSuccess) {
          return ListView.builder(
            itemCount: state.movimentacoes.length,
            itemBuilder: (context, index) {
              final movimentacao = state.movimentacoes[index];
              return ItemMovimentacao(
                movimentacao: movimentacao,
              );
            },
          );
        } else {
          return const Center(child: Text('Erro ao carregar movimentações'));
        }
      },
    );
  }
}
