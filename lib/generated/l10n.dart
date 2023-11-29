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

  /// `Floor furniture`
  String get floorFurniture {
    return Intl.message(
      'Floor furniture',
      name: 'floorFurniture',
      desc: '',
      args: [],
    );
  }

  /// `Wall furniture`
  String get wallFurniture {
    return Intl.message(
      'Wall furniture',
      name: 'wallFurniture',
      desc: '',
      args: [],
    );
  }

  /// `Ceiling furniture`
  String get ceilingFurniture {
    return Intl.message(
      'Ceiling furniture',
      name: 'ceilingFurniture',
      desc: '',
      args: [],
    );
  }

  /// `Favourites`
  String get favourites {
    return Intl.message(
      'Favourites',
      name: 'favourites',
      desc: '',
      args: [],
    );
  }

  /// `show more`
  String get showMore {
    return Intl.message(
      'show more',
      name: 'showMore',
      desc: '',
      args: [],
    );
  }

  /// `View in AR`
  String get viewInAR {
    return Intl.message(
      'View in AR',
      name: 'viewInAR',
      desc: '',
      args: [],
    );
  }

  /// `View 3D model`
  String get view3dModel {
    return Intl.message(
      'View 3D model',
      name: 'view3dModel',
      desc: '',
      args: [],
    );
  }

  /// `There's nothing here yet`
  String get emptyPageMessage {
    return Intl.message(
      'There\'s nothing here yet',
      name: 'emptyPageMessage',
      desc: '',
      args: [],
    );
  }

  /// `Remove model`
  String get removeModel {
    return Intl.message(
      'Remove model',
      name: 'removeModel',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Try again`
  String get arError {
    return Intl.message(
      'Something went wrong. Try again',
      name: 'arError',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
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
