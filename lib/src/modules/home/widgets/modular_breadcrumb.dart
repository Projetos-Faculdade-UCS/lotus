import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:recase/recase.dart';

/// {@template breadcrumb}
/// A breadcrumb widget that provides navigation based on the current
/// modular route.
/// {@endtemplate}
class ModularBreadcrumb extends StatefulWidget {
  /// {@macro breadcrumb}
  const ModularBreadcrumb({super.key});

  @override
  State<ModularBreadcrumb> createState() => _ModularBreadcrumbState();
}

class _ModularBreadcrumbState extends State<ModularBreadcrumb> {
  late List<String> pathSegments;

  @override
  void initState() {
    super.initState();

    pathSegments = _getPathSegments(Modular.to.path);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 30, // Definimos uma altura fixa
      child: Row(
        children: [
          Wrap(
            spacing: 4, // Adiciona espaçamento entre os breadcrumbs
            children: List.generate(pathSegments.length, (index) {
              final isLast = index == pathSegments.length - 1;
              final segment = pathSegments[index];

              return InkWell(
                onTap: isLast
                    ? null
                    : () => _onBreadcrumbTap(index, pathSegments, isLast),
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Row(
                  children: [
                    Text(
                      _formatBreadcrumbSegment(segment, index),
                      style: TextStyle(
                        fontSize: isLast ? 18 : 14,
                        color: theme.colorScheme.onSurface,
                        fontWeight: isLast ? FontWeight.bold : FontWeight.w300,
                        height: .9,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (!isLast)
                      const Icon(
                        Icons.chevron_right,
                        size: 14,
                        color: Colors.grey,
                      ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  /// Extracts and cleans the path segments from the current route.
  List<String> _getPathSegments(String path) {
    return path
        .trim() // Remove extra spaces
        .replaceAll(RegExp(r'^/|/$'), '') // Remove leading and trailing slashes
        .split('/')
        .where((segment) => segment.isNotEmpty) // Filter out empty segments
        .toList();
  }

  /// Handles breadcrumb tap navigation.
  void _onBreadcrumbTap(int index, List<String> segments, bool isLast) {
    if (!isLast) {
      final newPath = '/${segments.sublist(0, index + 1).join('/')}';
      Modular.to.navigate(newPath);
    }
  }

  /// Formats the breadcrumb segment text, converting it
  /// to title case and handling the "Home" case.
  String _formatBreadcrumbSegment(String segment, int index) {
    return segment.replaceAll('-', ' ').titleCase;
  }
}
