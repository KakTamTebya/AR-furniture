import 'package:flutter/material.dart';
import 'package:ar_furniture/ui/app.dart';
import 'package:ar_furniture/repositories/furniture/furniture_repositories.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ar_furniture/repositories/favourites/favourites_repositories.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GetIt.I.registerSingletonAsync<AbstractFavouritesRepository>(
          () async => LocalFavouritesRepository(
              sharedPreferences: await SharedPreferences.getInstance()));
  GetIt.I.registerLazySingleton<AbstractFurnitureRepository>(
          () => FirestoreFurnitureRepository(db: FirebaseFirestore.instance));
  // GetIt.I.registerLazySingleton<AbstractFurnitureRepository>(
  //         () => MockFurnitureRepository());
  //debugPaintSizeEnabled = true;
  runApp(App());
}
