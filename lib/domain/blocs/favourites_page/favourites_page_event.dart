part of 'favourites_page_bloc.dart';

abstract class FavouritesPageEvent extends Equatable {
  const FavouritesPageEvent();
}

class LoadFavouritesPage extends FavouritesPageEvent {

  final Completer? completer;

  const LoadFavouritesPage({this.completer});

  @override
  List<Object?> get props => [completer];
}

class AddFavourite extends FavouritesPageEvent {

  final FurnitureItem furnitureItem;

  const AddFavourite({required this.furnitureItem});

  @override
  List<Object?> get props => [furnitureItem];
}

class RemoveFavourite extends FavouritesPageEvent {

  final FurnitureItem furnitureItem;

  const RemoveFavourite({required this.furnitureItem});

  @override
  List<Object?> get props => [furnitureItem];
}

