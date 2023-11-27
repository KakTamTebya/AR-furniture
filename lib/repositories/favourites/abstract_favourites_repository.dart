import 'dart:async';

abstract class AbstractFavouritesRepository {

  FutureOr<bool> saveFavourite(String id);

  FutureOr<bool> removeFavourite(String id);

  // null - ошибка
  FutureOr<bool?> isFavourite(String id);

  // null - ошибка
  FutureOr<List<String>?> getFavourites();
}
