import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/app_widget.dart';
import 'package:lotus/src/modules/app_module.dart';
import 'package:menubar/menubar.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setApplicationMenu([]);
  timeago.setLocaleMessages('pt', timeago.PtBrMessages());

  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
