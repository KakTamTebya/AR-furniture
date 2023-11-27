part of 'details_page_bloc.dart';

abstract class DetailsPageEvent extends Equatable {
  const DetailsPageEvent();
}

class LoadDetailsPage extends DetailsPageEvent {

  @override
  List<Object?> get props => [];
}

class AddFavourite extends DetailsPageEvent {

  @override
  List<Object?> get props => [];
}

class RemoveFavourite extends DetailsPageEvent {

  @override
  List<Object?> get props => [];
}
