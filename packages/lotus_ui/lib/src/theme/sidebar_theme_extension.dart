import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

/// The extension of the sidebar theme.
class SidebarXThemeExtension extends ThemeExtension<SidebarXThemeExtension> {
  /// The extension of the sidebar theme.
  SidebarXThemeExtension({
    required this.sidebarXTheme,
    required this.extendedSidebarXTheme,
  });

  /// The theme of the sidebar.
  final SidebarXTheme sidebarXTheme;

  /// The theme of the extended sidebar.
  final SidebarXTheme extendedSidebarXTheme;

  @override
  SidebarXThemeExtension copyWith({
    SidebarXTheme? sidebarXTheme,
    SidebarXTheme? extendedSidebarXTheme,
  }) {
    return SidebarXThemeExtension(
      sidebarXTheme: sidebarXTheme ?? this.sidebarXTheme,
      extendedSidebarXTheme:
          extendedSidebarXTheme ?? this.extendedSidebarXTheme,
    );
  }

  @override
  SidebarXThemeExtension lerp(
    ThemeExtension<SidebarXThemeExtension>? other,
    double t,
  ) {
    if (other is! SidebarXThemeExtension) return this;
    return SidebarXThemeExtension(
      sidebarXTheme: sidebarXTheme.mergeWith(other.sidebarXTheme),
      extendedSidebarXTheme:
          extendedSidebarXTheme.mergeWith(other.extendedSidebarXTheme),
    );
  }
}
