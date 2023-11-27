part of 'furniture_list_page_bloc.dart';

abstract class FurnitureListPageEvent extends Equatable {
  const FurnitureListPageEvent();
}

class LoadFurnitureList extends FurnitureListPageEvent {
  final Completer? completer;
  const LoadFurnitureList({this.completer});

  @override
  List<Object?> get props => [completer];
}
