// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lotus_ui/lotus_ui.dart';

void main() {
  group('Miolo', () {
    test('can be instantiated', () {
      expect(
        Miolo(
          child: const Center(
            child: Text('Ice-Cream'),
          ),
        ),
        isNotNull,
      );
    });
  });
}
