import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/app_widget.dart';
import 'package:lotus/src/modules/app_module.dart';
import 'package:menubar/menubar.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();
  await windowManager.setMinimumSize(const Size(800, 600));
  await windowManager.waitUntilReadyToShow();
  await windowManager.setAsFrameless();
  await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
  await windowManager.center();
  await setApplicationMenu([]);

  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
