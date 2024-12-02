import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/events.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/sala_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/widgets/lista_salas.dart';
import 'package:repositories/repositories.dart';

/// Dialog para alterar a localização de um ativo.
class MudarLocalDialog extends StatelessWidget {
  /// {@macro mudar_local_dialog}
  const MudarLocalDialog({
    required this.bloc,
    super.key,
  });

  /// O bloc da sala.
  final SalaBloc bloc;

  static const _modalKey = ValueKey('mudar_local_dialog');

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);

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
          children: [
            AppBar(
              centerTitle: true,
              title: Text(
                'Mudar Local',
                style: TextStyle(
                  fontSize: 24,
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
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
            // dotted card weitten 'novo local' in the middle
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Buscar Sala',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (text) {
                // Dispatch the GetAllSalas event with the input text
                bloc.add(GetAllSalas(nomeSala: text));
              },
            ),
            // Lista de salas
            Expanded(
              child: ListaSalas(
                bloc: bloc,
              ),
            ),
            //submit button
          ],
        ),
      ),
    );
  }

  static Future<Sala?> show(
    SalaBloc bloc,
  ) async {
    await Future.delayed(const Duration(milliseconds: 100), () {});
    return Modular.to.push<Sala?>(
      PageRouteBuilder<Sala?>(
        fullscreenDialog: true,
        opaque: false,
        barrierColor: Colors.black38,
        barrierDismissible: true,
        barrierLabel: 'mudar_local_dialog',
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        settings: const RouteSettings(
          name: 'mudar_local_dialog',
        ),
        pageBuilder: (context, animation, secondaryAnimation) {
          return Material(
            color: Colors.transparent,
            child: MudarLocalDialog(
              bloc: bloc,
              key: _modalKey,
            ),
          );
        },
      ),
    );
  }
}
