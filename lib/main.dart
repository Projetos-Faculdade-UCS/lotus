import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:lotus/src/app_widget.dart';
import 'package:lotus/src/modules/app_module.dart';
import 'package:lotus/src/modules/home/widgets/title_bar/search_bar/search_modal.dart';
import 'package:lotus_utils/lotus_utils.dart';
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
  // For hot reload, `unregisterAll()` needs to be called.
  await hotKeyManager.unregisterAll();

  await _initSearchHotkey();
  initTimeAgo();

  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}

Future<void> _initSearchHotkey() async {
  final hotKey = HotKey(
    key: PhysicalKeyboardKey.keyF,
    modifiers: [HotKeyModifier.control],
    scope: HotKeyScope.inapp,
  );
  var isModalOpened = false;
  await hotKeyManager.register(
    hotKey,
    keyDownHandler: (hotKey) async {
      if (isModalOpened) {
        await SystemChannels.textInput.invokeMethod('TextInput.hide');
        Modular.to.pop();
        return;
      }
      isModalOpened = true;
      await SearchModal.show();
      isModalOpened = false;
    },
  );
}
