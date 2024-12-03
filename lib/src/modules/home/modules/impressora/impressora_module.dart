import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/modules/home/modules/impressora/bloc/impressoras_bloc.dart';
import 'package:lotus/src/modules/home/modules/impressora/pages/impressora_page.dart';
import 'package:lotus/src/modules/home/modules/impressora/pages/impressoras_page.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/movimentacao_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/sala_bloc.dart';
import 'package:lotus/src/modules/home/nested_module.dart';
import 'package:repositories/repositories.dart';

/// The Ice-Cream module of the application.
class ImpressoraModule extends Module {
  @override
  List<Module> get imports => [NestedModule()];

  @override
  void binds(Injector i) {
    i
      ..addLazySingleton<ImpressoraRepository>(ImpressoraRepository.new)
      ..add<ImpressorasBloc>(ImpressorasBloc.new)
      ..add<SalaRepository>(SalaRepository.new)
      ..add<SalaBloc>(SalaBloc.new)
      ..addLazySingleton<MovimentacaoBloc<BaseAtivoRepository>>(
        () => MovimentacaoBloc<ImpressoraRepository>(
          i.get<ImpressoraRepository>(),
        ),
      );
  }

  @override
  void routes(RouteManager r) {
    r
      ..child(
        '/',
        child: (_) => ImpressorasPage(impressorasBloc: Modular.get()),
      )
      ..child(
        '/:id',
        child: (_) => ImpressoraPage(
          impressorasBloc: Modular.get(),
          id: int.parse(r.args.params['id'] as String),
        ),
      );
  }
}
