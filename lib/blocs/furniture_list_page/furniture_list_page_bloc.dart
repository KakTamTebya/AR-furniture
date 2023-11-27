import 'dart:async';

import 'package:ar_furniture/models/models.dart';
import 'package:ar_furniture/repositories/furniture/abstract_furniture_repository.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'furniture_list_page_event.dart';
part 'furniture_list_page_state.dart';

class FurnitureListPageBloc extends Bloc<FurnitureListPageEvent, FurnitureListPageState> {

  Future<void> _onLoad(
      LoadFurnitureList event,
      Emitter<FurnitureListPageState> emit) async {
    try {
      if (state is! FurnitureListPageLoaded) {
        emit(FurnitureListPageLoading());
      }
      final furnitureItems = await abstractFurnitureRepository
          .getFurnitureItems(furnitureType);
      emit(FurnitureListPageLoaded(furnitureItems: furnitureItems));
    }
    catch (e) {
      emit(FurnitureListPageLoadingFail(exception: e));
    }
    finally {
      event.completer?.complete();
    }
  }

  FurnitureListPageBloc({
    required this.abstractFurnitureRepository,
    required this.furnitureType}) : super(FurnitureListPageInitial()) {
    on<LoadFurnitureList>(_onLoad);
  }

  final AbstractFurnitureRepository abstractFurnitureRepository;
  final FurnitureType furnitureType;
}
