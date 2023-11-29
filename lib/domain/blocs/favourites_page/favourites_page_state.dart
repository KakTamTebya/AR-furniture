part of 'favourites_page_bloc.dart';

abstract class FavouritesPageState extends Equatable {
  const FavouritesPageState();
}

class FavouritesPageInitial extends FavouritesPageState {
  @override
  List<Object> get props => [];
}

class FavouritesPageLoading extends FavouritesPageState {

  @override
  List<Object?> get props => [];
}

class FavouritesPageLoaded extends FavouritesPageState {
  final Map<FurnitureItem, bool> items;

  const FavouritesPageLoaded({
    required this.items,
  });

  @override
  List<Object?> get props => [items];
}

class FavouritesPageLoadingFail extends FavouritesPageState {
  final Object exception;

  const FavouritesPageLoadingFail({required this.exception});

  @override
  List<Object> get props => [exception];
}

class FavouritesPageFavouriteClickFail extends FavouritesPageLoaded {
  final Object exception;

  const FavouritesPageFavouriteClickFail({
    required this.exception,
    required super.items,
  });

  @override
  List<Object> get props => [exception, items];
}
