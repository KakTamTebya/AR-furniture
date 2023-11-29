import 'dart:async';

import 'abstract_favourites_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalFavouritesRepository implements AbstractFavouritesRepository{

  static const String preferencesKey = "favourites";

  final SharedPreferences _sharedPreferences;

  const LocalFavouritesRepository({
    required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  Future<bool> _saveFavourites(List<String> favourites) async {
    try {
      await _sharedPreferences.setStringList(preferencesKey, favourites);
    }
    catch (e) {
      return false;
    }
    return true;
  }

  @override
  List<String>? getFavourites() {
    try {
      return _sharedPreferences.getStringList(preferencesKey) ?? List.empty(
          growable: true);
    }
    catch (e) {
      return null;
    }
  }

  @override
  FutureOr<bool> removeFavourite(String id) async {
    var favourites = getFavourites();
    if (favourites == null) {
      return false;
    }
    final result = favourites.remove(id);
    if (!result) {
      return false;
    }
    return await _saveFavourites(favourites);
  }

  @override
  FutureOr<bool> saveFavourite(String id) async {
    var favourites = getFavourites();
    if (favourites == null) {
      return false;
    }
    favourites.insert(0, id);
    return await _saveFavourites(favourites);
  }

  @override
  bool? isFavourite(String id) {
    var favourites = getFavourites();
    if (favourites == null) {
      return null;
    }
    return favourites.contains(id);
  }
}
