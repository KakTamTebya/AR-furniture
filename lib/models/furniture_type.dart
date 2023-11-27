import 'package:equatable/equatable.dart';
import 'package:ar_furniture/generated/l10n.dart';

sealed class FurnitureType extends Equatable {
  String getCollectionName();

  @override
  String toString();
}

class FloorFurniture implements FurnitureType{
  @override
  String getCollectionName() {
    return "floor";
  }

  @override
  List<Object?> get props => ["floor"];

  @override
  bool? get stringify => false;

  @override
  String toString() {
    return S.current.floorFurniture;
  }
}

class WallFurniture implements FurnitureType {
  @override
  String getCollectionName() {
    return "wall";
  }

  @override
  List<Object?> get props => ["wall"];

  @override
  bool? get stringify => false;

  @override
  String toString() {
    return S.current.wallFurniture;
  }
}

class CeilingFurniture implements FurnitureType {
  @override
  String getCollectionName() {
    return "ceiling";
  }

  @override
  List<Object?> get props => ["ceiling"];

  @override
  bool? get stringify => false;

  @override
  String toString() {
    return S.current.ceilingFurniture;
  }
}
