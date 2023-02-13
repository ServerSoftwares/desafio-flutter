// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Serviços de localização desabilitados. Por favor, os habilite.`
  String get moonPhasePageLocationDisabled {
    return Intl.message(
      'Serviços de localização desabilitados. Por favor, os habilite.',
      name: 'moonPhasePageLocationDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Permissão de acesso à localização negada.`
  String get moonPhasePagePermissionDenied {
    return Intl.message(
      'Permissão de acesso à localização negada.',
      name: 'moonPhasePagePermissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `Permissão de acesso à localização permanentemente negada, não podemos solicitar solicitar perrmissão.`
  String get moonPhasePagePermissionPermanentlyDenied {
    return Intl.message(
      'Permissão de acesso à localização permanentemente negada, não podemos solicitar solicitar perrmissão.',
      name: 'moonPhasePagePermissionPermanentlyDenied',
      desc: '',
      args: [],
    );
  }

  /// `Observador App`
  String get moonPhasePageAppBarTitle {
    return Intl.message(
      'Observador App',
      name: 'moonPhasePageAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Selecione uma data:`
  String get moonPhasePagePickDate {
    return Intl.message(
      'Selecione uma data:',
      name: 'moonPhasePagePickDate',
      desc: '',
      args: [],
    );
  }

  /// `Ocorreu um erro!`
  String get genericError {
    return Intl.message(
      'Ocorreu um erro!',
      name: 'genericError',
      desc: '',
      args: [],
    );
  }

  /// `Falha de conexão!`
  String get failedConnection {
    return Intl.message(
      'Falha de conexão!',
      name: 'failedConnection',
      desc: '',
      args: [],
    );
  }

  /// `Tente Novamente`
  String get tryAgain {
    return Intl.message(
      'Tente Novamente',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Corpos Celestes`
  String get celestialBodyPageAppBarTitle {
    return Intl.message(
      'Corpos Celestes',
      name: 'celestialBodyPageAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Selecione um corpo celeste:`
  String get celestialBodyPagePickBody {
    return Intl.message(
      'Selecione um corpo celeste:',
      name: 'celestialBodyPagePickBody',
      desc: '',
      args: [],
    );
  }

  /// `Posição (graus): `
  String get celestialBodyPagePickBodyPosition {
    return Intl.message(
      'Posição (graus): ',
      name: 'celestialBodyPagePickBodyPosition',
      desc: '',
      args: [],
    );
  }

  /// `Distância da Terra (Km): `
  String get celestialBodyPagePickBodyDistance {
    return Intl.message(
      'Distância da Terra (Km): ',
      name: 'celestialBodyPagePickBodyDistance',
      desc: '',
      args: [],
    );
  }

  /// `Constelações`
  String get starChartPageAppBarTitle {
    return Intl.message(
      'Constelações',
      name: 'starChartPageAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Selecione uma constelação`
  String get starChatPagePickConstellation {
    return Intl.message(
      'Selecione uma constelação',
      name: 'starChatPagePickConstellation',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
