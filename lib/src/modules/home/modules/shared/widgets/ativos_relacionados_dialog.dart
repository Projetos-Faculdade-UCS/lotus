import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/ativos_relacionados_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/events.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/states.dart';
import 'package:lotus/src/modules/home/modules/shared/widgets/lista_ativos_relacionados.dart';
import 'package:repositories/repositories.dart';

/// {@template ativos_relacionados_dialog}
/// Diálogo que exibe os ativos relacionados a um computador.
/// {@endtemplate}
class AtivosRelacionadosDialog extends StatelessWidget {
  /// {@macro ativos_relacionados_dialog}
  const AtivosRelacionadosDialog({
    required this.bloc,
    required this.ativo,
    super.key,
  });

  /// O bloc dos ativos relacionados.
  final AtivosRelacionadosBloc bloc;

  /// Ativo referecia para carregar os ativos relacionados.
  final Ativo ativo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        width: size.width * .45,
        height: size.height * .90,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              centerTitle: true,
              title: SizedBox(
                child: IntrinsicWidth(
                  child: Row(
                    children: [
                      Icon(
                        HugeIcons.strokeRoundedWorkflowSquare06,
                        color: theme.colorScheme.primary,
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Ativos relacionados',
                        style: TextStyle(
                          fontSize: 24,
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Modular.to.pop();
                  },
                ),
              ],
            ),
            TipoAtivoIcone(
              tipo: ativo.tipo,
            ),
            SizedBox(
              height: 24,
              child: VerticalDivider(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            Divider(
              height: 0,
              thickness: 1,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 8,
                  child: VerticalDivider(
                    width: 0.5,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                SizedBox(
                  height: 8,
                  child: VerticalDivider(
                    width: 0.5,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<AtivosRelacionadosBloc, GenericState>(
                bloc: bloc..add(GetAtivosRelacionados(ativo.id)),
                builder: (context, state) {
                  if (state is GenericInitial || state is GenericLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is AtivosRelacionadosSuccess) {
                    return ListaAtivosRelacionados(
                      ativos: state.ativos,
                      tipoAtivoPai: ativo.tipo,
                    );
                  } else {
                    return const Center(
                      child: Text('Erro ao carregar ativos relacionados.'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Exibe o diálogo com listagem de ativos relacionados.
  static Future<void> show(
    AtivosRelacionadosBloc bloc,
    Ativo ativo,
  ) async {
    return Modular.to.push<void>(
      PageRouteBuilder<void>(
        fullscreenDialog: true,
        opaque: false,
        barrierColor: Colors.black38,
        barrierDismissible: true,
        barrierLabel: 'listar_ativos_relacionados',
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        settings: const RouteSettings(
          name: 'listar_ativos_relacionados',
        ),
        pageBuilder: (context, animation, secondaryAnimation) {
          return Material(
            color: Colors.transparent,
            child: AtivosRelacionadosDialog(
              bloc: bloc,
              ativo: ativo,
            ),
          );
        },
      ),
    );
  }
}
