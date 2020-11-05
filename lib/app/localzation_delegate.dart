import 'package:flutter/cupertino.dart';

class FallbackLocalisationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(FallbackLocalisationsDelegate old) => false;
}