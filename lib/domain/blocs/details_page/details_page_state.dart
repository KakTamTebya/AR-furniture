part of 'details_page_bloc.dart';

abstract class DetailsPageState extends Equatable {
  const DetailsPageState();
}

class DetailsPageInitial extends DetailsPageState {
  @override
  List<Object> get props => [];
}

class DetailsPageLoading extends DetailsPageState {
  @override
  List<Object?> get props => [];
}

class DetailsPageLoaded extends DetailsPageState {
  final bool isFavourite;

  const DetailsPageLoaded({
    required this.isFavourite,
  });

  @override
  List<Object?> get props => [isFavourite];
}

class DetailsPageLoadingFail extends DetailsPageState {
  final Object exception;

  const DetailsPageLoadingFail({required this.exception});

  @override
  List<Object> get props => [exception];
}

class DetailsPageFavouriteClickFail extends DetailsPageState {
  final Object exception;

  const DetailsPageFavouriteClickFail({required this.exception});

  @override
  List<Object> get props => [exception];
}
