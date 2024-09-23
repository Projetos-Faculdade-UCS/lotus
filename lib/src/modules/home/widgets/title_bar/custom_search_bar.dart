import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// Search bar.
class CustomSearchBar extends StatelessWidget {
  /// Default constructor.
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'search-bar',
      child: SearchBar(
        elevation: const WidgetStatePropertyAll(0),
        onTap: () {
          Modular.to.push(
            PageRouteBuilder<void>(
              fullscreenDialog: true,
              opaque: false,
              barrierColor: Colors.black.withOpacity(0.5),
              barrierDismissible: true,
              pageBuilder: (context, animation, secondaryAnimation) {
                return FadeTransition(
                  opacity: animation,
                  child: const _SearchModal(),
                );
              },
            ),
          );
        },
        shape: WidgetStateProperty.resolveWith(
          (states) {
            final borderOpacity =
                states.contains(WidgetState.hovered) ? .9 : .5;
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.grey.withOpacity(borderOpacity),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SearchModal extends StatelessWidget {
  const _SearchModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * .2,
      child: Center(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          width: MediaQuery.of(context).size.width * .6,
          height: MediaQuery.of(context).size.height * .6,
          child: Column(
            children: [
              Hero(
                tag: 'search-bar',
                child: SearchBar(
                  elevation: const WidgetStatePropertyAll(0),
                  shape: WidgetStateProperty.resolveWith(
                    (states) {
                      final borderOpacity =
                          states.contains(WidgetState.hovered) ? .9 : .5;
                      return RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.grey.withOpacity(borderOpacity),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
