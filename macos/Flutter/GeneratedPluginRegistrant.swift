//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import device_info_plus
import hotkey_manager_macos
import irondash_engine_context
import menubar
import screen_retriever_macos
import shared_preferences_foundation
import super_native_extensions
import window_manager

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  DeviceInfoPlusMacosPlugin.register(with: registry.registrar(forPlugin: "DeviceInfoPlusMacosPlugin"))
  HotkeyManagerMacosPlugin.register(with: registry.registrar(forPlugin: "HotkeyManagerMacosPlugin"))
  IrondashEngineContextPlugin.register(with: registry.registrar(forPlugin: "IrondashEngineContextPlugin"))
  MenubarPlugin.register(with: registry.registrar(forPlugin: "MenubarPlugin"))
  ScreenRetrieverMacosPlugin.register(with: registry.registrar(forPlugin: "ScreenRetrieverMacosPlugin"))
  SharedPreferencesPlugin.register(with: registry.registrar(forPlugin: "SharedPreferencesPlugin"))
  SuperNativeExtensionsPlugin.register(with: registry.registrar(forPlugin: "SuperNativeExtensionsPlugin"))
  WindowManagerPlugin.register(with: registry.registrar(forPlugin: "WindowManagerPlugin"))
}
