import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:ar_furniture/domain/repositories/favourites/abstract_favourites_repository.dart';

part 'details_page_event.dart';
part 'details_page_state.dart';

class DetailsPageBloc extends Bloc<DetailsPageEvent, DetailsPageState> {

  Future<void> _onLoad(
      LoadDetailsPage event,
      Emitter<DetailsPageState> emit) async {
    try {
      if (state is! DetailsPageLoaded) {
        emit(DetailsPageLoading());
      }
      final isFavourite = await abstractFavouritesRepository
          .isFavourite(furnitureItemId);
      if (isFavourite == null) {
        emit(DetailsPageLoadingFail(exception: Exception("LoadingFailure")));
      }
      else {
        emit(DetailsPageLoaded(isFavourite: isFavourite));
      }
    }
    catch (e) {
      emit(DetailsPageLoadingFail(exception: e));
    }
  }

  Future<void> _onAddFavourite(
      AddFavourite event,
      Emitter<DetailsPageState> emit) async {
    try {
      final isAdded = await abstractFavouritesRepository
          .saveFavourite(furnitureItemId);
      emit(isAdded
          ? const DetailsPageLoaded(isFavourite: true)
          : DetailsPageFavouriteClickFail(
          exception: Exception("AddFavouriteFailure")));
    }
    catch (e) {
      emit(DetailsPageFavouriteClickFail(exception: e));
    }
  }//TODO Отрефакторить этот и следующий методы чтобы не дублировать похожий код

  Future<void> _onRemoveFavourite(
      RemoveFavourite event,
      Emitter<DetailsPageState> emit) async {
    try {
      final isRemoved = await abstractFavouritesRepository
          .removeFavourite(furnitureItemId);
      emit(isRemoved
          ? const DetailsPageLoaded(isFavourite: false)
          : DetailsPageFavouriteClickFail(
          exception: Exception("RemoveFavouriteFailure")));
    }
    catch (e) {
      emit(DetailsPageFavouriteClickFail(exception: e));
    }
  }

  DetailsPageBloc({
    required this.furnitureItemId,
    required this.abstractFavouritesRepository}) : super(DetailsPageInitial()) {
    on<LoadDetailsPage>(_onLoad);
    on<DetailsPageEvent> ((event, emit) async {
      if (event is AddFavourite) {
        await _onAddFavourite(event, emit);
      }
      if (event is RemoveFavourite) {
        await _onRemoveFavourite(event, emit);
      }
    }, transformer: sequential());
  }

  final String furnitureItemId;
  final AbstractFavouritesRepository abstractFavouritesRepository;
}
