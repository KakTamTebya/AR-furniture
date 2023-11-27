import 'dart:async';
import 'package:ar_furniture/models/models.dart';

abstract class AbstractFurnitureRepository {
  FutureOr<List<FurnitureItem>> getFurnitureItems(FurnitureType furnitureType);
  FutureOr<FurnitureItem?> getFurnitureItem(String id);
}
