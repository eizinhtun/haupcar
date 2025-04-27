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
      'back': 'Go back to First Page',
      'no_categories': 'No Categories',
      'check_back_later': 'Please check back later!',
      'no_products': 'No Products Found',
      'try_different_category': 'Try selecting a different category!',
      'reload': 'Reload',
      'retry': 'Retry',
      'no_internet': 'No Internet Connection',
      'check_connection': 'Please check your connection and try again.',
    },
    'th': {
      'home': 'หน้าแรก',
      'categories': 'หมวดหมู่',
      'language': 'ภาษา',
      'english': 'อังกฤษ',
      'thai': 'ไทย',
      'back': 'กลับไปหน้าหลัก',
      'no_categories': 'ไม่มีหมวดหมู่',
      'check_back_later': 'กรุณาตรวจสอบอีกครั้งภายหลัง',
      'no_products': 'ไม่พบสินค้า',
      'try_different_category': 'ลองเลือกหมวดหมู่อื่นดูนะคะ',
      'reload': 'โหลดใหม่',
      'retry': 'ลองใหม่',
      'no_internet': 'ไม่มีการเชื่อมต่ออินเทอร์เน็ต',
      'check_connection': 'กรุณาตรวจสอบการเชื่อมต่อและลองอีกครั้ง',
    },
  };

  String get home => _localizedValues[locale.languageCode]!['home']!;
  String get categories =>
      _localizedValues[locale.languageCode]!['categories']!;
  String get language => _localizedValues[locale.languageCode]!['language']!;
  String get english => _localizedValues[locale.languageCode]!['english']!;
  String get thai => _localizedValues[locale.languageCode]!['thai']!;
  String get back => _localizedValues[locale.languageCode]!['back']!;
  String get noCategories =>
      _localizedValues[locale.languageCode]!['no_categories']!;
  String get checkBackLater =>
      _localizedValues[locale.languageCode]!['check_back_later']!;
  String get noProducts =>
      _localizedValues[locale.languageCode]!['no_products']!;
  String get tryDifferentCategory =>
      _localizedValues[locale.languageCode]!['try_different_category']!;
  String get reload => _localizedValues[locale.languageCode]!['reload']!;
  String get retry => _localizedValues[locale.languageCode]!['retry']!;
  String get noInternet =>
      _localizedValues[locale.languageCode]!['no_internet']!;
  String get checkConnection =>
      _localizedValues[locale.languageCode]!['check_connection']!;

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
