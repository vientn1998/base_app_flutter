import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localzation_delegate.dart';

final localizationsDelegates = <LocalizationsDelegate>[
  AppLocalizationsDelegate(),
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  const FallbackLocalisationsDelegate()
];


class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(
        context, AppLocalizations);
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    "vi": {
      "welcome_app": "Chào mừng bạn đến với {name}!",
    },
    "en": {
      "welcome_app": "Welcome to the {name}!",
    },
  };

  /// This method returns the localized value of the passed id
  /// it defaults to english if the locale is missing
  String _localizedValue(String id) =>
      _localizedValues[locale.languageCode][id] ?? _localizedValues["en"][id];

  // Generic
  String welcomeName(String name) {
    return _localizedValue("welcome_app").replaceAll("{name}", name);
  }

  String authErrorMessage(String code) {
    switch (code) {
      case "ERROR_USER_NOT_FOUND":
        return _localizedValue("login_fail_user_not_found");
      default:
        return _localizedValue("login_fail").replaceAll("{code}", code);
    }
  }
}

class AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ["vi", "en"].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(
        AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}