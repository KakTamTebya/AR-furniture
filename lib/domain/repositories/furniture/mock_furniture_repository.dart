import 'package:ar_furniture/domain/models/models.dart';
import 'package:ar_furniture/mocks/mocks.dart';
import 'abstract_furniture_repository.dart';

class MockFurnitureRepository implements AbstractFurnitureRepository {
  @override
  List<FurnitureItem> getFurnitureItems(FurnitureType furnitureType) {
    switch (furnitureType) {
      case FloorFurniture():
        return Mocks.floorFurnitureMock;
      case WallFurniture():
        return Mocks.wallFurnitureMock;
      case CeilingFurniture():
        return Mocks.ceilingFurnitureMock;
    }
  }

  @override
  FurnitureItem? getFurnitureItem(String id) {
    final mocks = [
      Mocks.floorFurnitureMock,
      Mocks.wallFurnitureMock,
      Mocks.ceilingFurnitureMock
    ];
    final intId = int.tryParse(id);
    if (intId == null || intId < 0 || intId > 29){
      return null;
    }
    return mocks[intId ~/ 10][intId % 10];
  }
}
