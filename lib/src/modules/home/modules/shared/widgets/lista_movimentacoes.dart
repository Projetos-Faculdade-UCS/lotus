import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/events.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/movimentacao_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/states.dart';
import 'package:lotus/src/modules/home/modules/shared/widgets/item_movimentacao.dart';

/// Widget que exibe a lista de movimentações de um ativo
class ListaMovimentacoes extends StatefulWidget {
  /// Construtor padrão
  const ListaMovimentacoes({
    required this.bloc,
    required this.idAtivo,
    super.key,
  });

  /// Bloc da movimentação
  final MovimentacaoBloc bloc;

  /// Id do ativo
  final int idAtivo;

  @override
  State<ListaMovimentacoes> createState() => _ListaMovimentacoesState();
}

class _ListaMovimentacoesState extends State<ListaMovimentacoes> {
  @override
  void initState() {
    super.initState();
    widget.bloc.add(GetAllMovimentacoes(widget.idAtivo));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovimentacaoBloc, GenericState>(
      bloc: widget.bloc,
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
                index: state.movimentacoes.length - index,
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
