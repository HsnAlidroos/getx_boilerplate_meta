import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/utils/storage.dart';
import '../../core/utils/app_keys.dart';

class ThemeService {
  // Use AppKeys constant for storage key
  static const _key = AppKeys.currentTheme;

  /// Returns the saved ThemeMode or ThemeMode.system if none saved.
  static ThemeMode getThemeMode() {
    final stored = box.read(_key);
    if (stored == null) return ThemeMode.system;
    return stored == true ? ThemeMode.dark : ThemeMode.light;
  }

  /// Saves the selected theme mode and updates Get's themeMode.
  static void changeTheme(ThemeMode mode) {
    box.write(_key, mode == ThemeMode.dark);
    Get.changeThemeMode(mode);
  }
}
