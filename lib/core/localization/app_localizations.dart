import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static const _localizedValues = {
    'en': {
      'title': 'Goods App',
      'categories': 'Categories',
      'products': 'Products',
    },
    'th': {
      'title': 'แอปสินค้า',
      'categories': 'หมวดหมู่',
      'products': 'สินค้า',
    },
  };

  String? get title {
    return _localizedValues[locale.languageCode]!['title'];
  }

  String? get categories {
    return _localizedValues[locale.languageCode]!['categories'];
  }

  String? get products {
    return _localizedValues[locale.languageCode]!['products'];
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
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
