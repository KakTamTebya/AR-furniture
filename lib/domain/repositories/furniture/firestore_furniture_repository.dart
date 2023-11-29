import 'dart:async';
import 'package:ar_furniture/domain/models/models.dart';
import 'abstract_furniture_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreFurnitureRepository implements AbstractFurnitureRepository {
  final FirebaseFirestore _db;
  const FirestoreFurnitureRepository({required FirebaseFirestore db})
      : _db = db;

  @override
  Future<List<FurnitureItem>> getFurnitureItems(
      FurnitureType furnitureType) async {
    final querySnapshot = await _db
        .collection("furniture")
        .doc(furnitureType.getCollectionName())
        .collection("items")
        .get();
    final List<FurnitureItem> furnitureItems = [];
    for (final documentSnapshot in querySnapshot.docs) {
      final document = documentSnapshot.data();
      document.addAll({"id": documentSnapshot.reference.path});
      furnitureItems.add(FurnitureItem.fromJson(document));
    }
    return furnitureItems;
  }

  @override
  Future<FurnitureItem?> getFurnitureItem(String id) async {
    final pathParts = id.split("/");
    if (pathParts.length != 4) {
      return null;
    }
    final documentSnapshot = await _db
        .collection(pathParts[0])
        .doc(pathParts[1])
        .collection(pathParts[2])
        .doc(pathParts[3])
        .get();
    final document = documentSnapshot.data();
    if (document == null) {
      return null;
    }
    document.addAll({"id": documentSnapshot.reference.path});
    return FurnitureItem.fromJson(document);
  }
}
