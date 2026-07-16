import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/domain/wiewmodel/provider/theme_provider.dart';

void main() {
  group('ThemeNotifier Unit Tests', () {
    test('initial state should be light mode', () {
      final container = ProviderContainer();
      expect(container.read(themeProvider), ThemeMode.light);
    });

    test('toggleTheme should switch between light and dark', () {
      final container = ProviderContainer();
      final notifier = container.read(themeProvider.notifier);

      notifier.toggleTheme();
      expect(container.read(themeProvider), ThemeMode.dark);

      notifier.toggleTheme();
      expect(container.read(themeProvider), ThemeMode.light);
    });
  });
}
