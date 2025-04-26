import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('th', 'TH'),
  ];

  static const _localizedValues = {
    'en': {
      'home': 'Home',
      'categories': 'Categories',
      'language': 'Language',
      'english': 'English',
      'thai': 'Thai',
    },
    'th': {
      'home': 'หน้าแรก',
      'categories': 'หมวดหมู่',
      'language': 'ภาษา',
      'english': 'อังกฤษ',
      'thai': 'ไทย',
    },
  };

  String get home => _localizedValues[locale.languageCode]!['home']!;
  String get categories =>
      _localizedValues[locale.languageCode]!['categories']!;
  String get language => _localizedValues[locale.languageCode]!['language']!;
  String get english => _localizedValues[locale.languageCode]!['english']!;
  String get thai => _localizedValues[locale.languageCode]!['thai']!;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ??
        AppLocalizations(const Locale('en', 'US'));
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'th'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
