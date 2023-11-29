import 'dart:async';

import 'package:ar_furniture/domain/models/furniture_item.dart';
import 'package:ar_furniture/domain/repositories/favourites/abstract_favourites_repository.dart';
import 'package:ar_furniture/domain/repositories/furniture/abstract_furniture_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'favourites_page_event.dart';
part 'favourites_page_state.dart';

class FavouritesPageBloc extends Bloc<FavouritesPageEvent, FavouritesPageState> {

  Future<void> _onLoad(
      LoadFavouritesPage event,
      Emitter<FavouritesPageState> emit) async {
    try {
      if (state is! FavouritesPageLoaded) {
        emit(FavouritesPageLoading());
      }
      final favouritesIds = await abstractFavouritesRepository.getFavourites();
      if (favouritesIds == null) {
        emit(FavouritesPageLoadingFail(exception: Exception("LoadingFailure")));
      }
      else {
        final Map<FurnitureItem, bool> furnitureItems = {};
        for (final id in favouritesIds) {
          final item = await abstractFurnitureRepository.getFurnitureItem(id);
          if (item != null) {
            furnitureItems[item] = true;
          }
        }
        isFavouriteMap = furnitureItems;
        emit(FavouritesPageLoaded(
            items: Map<FurnitureItem, bool>.from(isFavouriteMap)));
      }
    }
    catch (e) {
      emit(FavouritesPageLoadingFail(exception: e));
    }
    finally {
      event.completer?.complete();
    }
  }

  Future<void> _onAddFavourite(
      AddFavourite event,
      Emitter<FavouritesPageState> emit) async {
    try {
      final isAdded = await abstractFavouritesRepository
          .saveFavourite(event.furnitureItem.id);
      isFavouriteMap[event.furnitureItem] = true;
      emit(isAdded
          ? FavouritesPageLoaded(
            items: Map<FurnitureItem, bool>.from(isFavouriteMap))
          : FavouritesPageFavouriteClickFail(
          exception: Exception("AddFavouriteFailure"),
          items: Map<FurnitureItem, bool>.from(isFavouriteMap)));
    }
    catch (e) {
      emit(FavouritesPageFavouriteClickFail(
          exception: e,
          items: Map<FurnitureItem, bool>.from(isFavouriteMap))
      );
    }
  }//TODO Отрефакторить этот и следующий методы чтобы не дублировать похожий код

  Future<void> _onRemoveFavourite(
      RemoveFavourite event,
      Emitter<FavouritesPageState> emit) async {
    try {
      final isRemoved = await abstractFavouritesRepository
          .removeFavourite(event.furnitureItem.id);
      isFavouriteMap[event.furnitureItem] = false;
      emit(isRemoved
          ? FavouritesPageLoaded(
            items: Map<FurnitureItem, bool>.from(isFavouriteMap))
          : FavouritesPageFavouriteClickFail(
          exception: Exception("RemoveFavouriteFailure"),
          items: Map<FurnitureItem, bool>.from(isFavouriteMap)));
    }
    catch (e) {
      emit(FavouritesPageFavouriteClickFail(
          exception: e,
          items: Map<FurnitureItem, bool>.from(isFavouriteMap))
      );
    }
  }

  FavouritesPageBloc({
    required this.abstractFavouritesRepository,
    required this.abstractFurnitureRepository}) : super(FavouritesPageInitial()) {
    on<LoadFavouritesPage>(_onLoad);
    on<AddFavourite>(_onAddFavourite);
    on<RemoveFavourite>(_onRemoveFavourite);
  }

  final AbstractFavouritesRepository abstractFavouritesRepository;
  final AbstractFurnitureRepository abstractFurnitureRepository;
  late Map<FurnitureItem, bool> isFavouriteMap;
}
