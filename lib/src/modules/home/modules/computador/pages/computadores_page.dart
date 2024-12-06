import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/modules/auth/bloc/auth_bloc.dart';
import 'package:lotus/src/modules/home/modules/computador/bloc/computador/computador_bloc.dart';
import 'package:lotus/src/modules/home/widgets/breadcrumb/miolo_with_breadcrumb.dart';
import 'package:repositories/repositories.dart';

/// {@template computadores_page}
/// Página de computadores.
/// {@endtemplate}
class ComputadoresPage extends StatelessWidget {
  /// {@macro computadores_page}
  const ComputadoresPage({
    required this.computadorBloc,
    super.key,
  });

  /// Bloc de computadores.
  final ComputadorBloc computadorBloc;

  @override
  Widget build(BuildContext context) {
    return MioloWithBreadcrumb(
      title: 'Computadores',
      actions: [
        BlocBuilder<AuthBloc, AuthState>(
          bloc: Modular.get<AuthBloc>(),
          builder: (context, state) {
            return AnimatedScale(
              scale: state.isAdmin ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutCubicEmphasized,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: TextButton.icon(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Modular.to.pushNamed('/computadores/cadastrar');
                  },
                  label: const Text('Cadastrar'),
                  // filled
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.secondary,
                    visualDensity: VisualDensity.comfortable,
                  ),
                ),
              ),
            );
          },
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: BlocProvider.value(
          value: computadorBloc.state is! FetchComputadoresSuccess
              ? (computadorBloc..add(FetchComputadores()))
              : computadorBloc,
          child: BlocBuilder<ComputadorBloc, ComputadorState>(
            builder: (context, state) {
              if (state is ComputadorLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FetchComputadoresSuccess) {
                return AtivosList(
                  ativos: state.computadores,
                  tipoAtivo: TipoAtivo.computador,
                );
              } else {
                return const Center(
                  child: Text('Erro ao carregar computadores.'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
