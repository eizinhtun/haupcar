import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haupcar/core/core.dart';
import 'package:haupcar/data/data.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en', 'US')) {
    _loadSavedLocale();
  }

  void switchToEnglish() => _saveLocale(const Locale('en', "US"));
  void switchToThai() => _saveLocale(const Locale('th', "TH"));

  Future<void> _saveLocale(Locale locale) async {
    getIt.get<SharedPrefs>().saveLocale(locale);
    emit(locale);
  }

  Future<void> _loadSavedLocale() async {
    final locale = getIt.get<SharedPrefs>().getLocale();
    emit(locale ?? Locale('en', "US"));
  }
}
