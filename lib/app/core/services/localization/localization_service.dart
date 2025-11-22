import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../../core/utils/storage.dart';
import '../../core/utils/app_keys.dart';

class LocalizationService extends Translations {
  static const fallbackLocale = Locale('en', 'US');

  static final locales = [const Locale('en', 'US'), const Locale('ar', 'SA')];

  static Locale get currentLocale => _currentLocale;
  static Locale _currentLocale = fallbackLocale;

  static Map<String, Map<String, String>> _localizedValues = {};

  @override
  Map<String, Map<String, String>> get keys => _localizedValues;

  static Future<void> init() async {
    _localizedValues = {
      'en_US': await _loadJson('assets/lang/en.json'),
      'ar_SA': await _loadJson('assets/lang/ar.json'),
    };
    // Load saved locale from storage (store only languageCode)
    final savedLang = box.read(AppKeys.currentLocale);
    if (savedLang != null && savedLang is String) {
      _currentLocale = _getLocaleFromLanguage(savedLang);
    } else {
      _currentLocale = fallbackLocale;
    }
  }

  static Future<Map<String, String>> _loadJson(String path) async {
    final jsonString = await rootBundle.loadString(path);
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  static void changeLocale(String languageCode) {
    Locale locale = _getLocaleFromLanguage(languageCode);
    _currentLocale = locale;
    // Persist selected language and update GetX locale
    box.write(AppKeys.currentLocale, languageCode);
    Get.updateLocale(locale);
  }

  static Locale _getLocaleFromLanguage(String languageCode) {
    for (var locale in locales) {
      if (locale.languageCode == languageCode) return locale;
    }
    return fallbackLocale;
  }
}
