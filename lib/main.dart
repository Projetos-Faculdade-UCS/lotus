import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/app_widget.dart';
import 'package:lotus/src/modules/app_module.dart';
import 'package:menubar/menubar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setApplicationMenu([]);

  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
