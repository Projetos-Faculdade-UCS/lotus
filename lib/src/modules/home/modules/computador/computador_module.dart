import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/modules/home/modules/computador/bloc/computador/computador_bloc.dart';
import 'package:lotus/src/modules/home/modules/computador/cubit/pendentes_cubit.dart';
import 'package:lotus/src/modules/home/modules/computador/pages/computador_page.dart';
import 'package:lotus/src/modules/home/modules/computador/pages/computadores_page.dart';
import 'package:lotus/src/modules/home/modules/computador/pages/new_computador_page.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/movimentacao_bloc.dart';
import 'package:lotus/src/modules/home/modules/computador/pages/pendentes_page.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/sala_bloc.dart';
import 'package:lotus/src/modules/home/nested_module.dart';
import 'package:repositories/repositories.dart';

/// Módulo de ativos de TI (lista, detalhes, etc.).
class ComputadorModule extends Module {
  @override
  List<Module> get imports => [NestedModule()];

  @override
  void binds(Injector i) {
    i
      ..addLazySingleton<ComputadorRepository>(ComputadorRepository.new)
      ..add<ComputadorBloc>(ComputadorBloc.new)
      ..add<SalaRepository>(SalaRepository.new)
      ..add<SalaBloc>(SalaBloc.new)
      ..add<MovimentacaoBloc>(MovimentacaoBloc.new)
      ..add<PendentesCubit>(PendentesCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r
      ..child(
        '/',
        child: (_) => ComputadoresPage(
          computadorBloc: Modular.get(),
        ),
      )
      ..child(
        '/:id',
        child: (_) => ComputadorPage(
          computadorBloc: Modular.get(),
          id: int.parse(r.args.params['id'] as String),
        ),
      )
      ..child(
        '/cadastrar',
        child: (_) => const NewComputadorPage(),
      )
      ..child(
        '/pendentes',
        child: (_) => PendentesPage(
          bloc: Modular.get(),
          cubit: Modular.get(),
        ),
      );
  }
}
