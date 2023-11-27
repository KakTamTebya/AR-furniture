part of 'furniture_list_page_bloc.dart';

abstract class FurnitureListPageState extends Equatable {
  const FurnitureListPageState();
}

class FurnitureListPageInitial extends FurnitureListPageState {
  @override
  List<Object> get props => [];
}

class FurnitureListPageLoading extends FurnitureListPageState {
  @override
  List<Object?> get props => [];
}

class FurnitureListPageLoaded extends FurnitureListPageState {
  final List<FurnitureItem> furnitureItems;

  const FurnitureListPageLoaded({
    required this.furnitureItems,
  });

  @override
  List<Object?> get props => [furnitureItems];
}

class FurnitureListPageLoadingFail extends FurnitureListPageState {
  final Object exception;

  const FurnitureListPageLoadingFail({required this.exception});

  @override
  List<Object> get props => [exception];
}
