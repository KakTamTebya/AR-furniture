import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ar_furniture/domain/models/furniture_item.dart';
import 'package:ar_furniture/domain/models/furniture_type.dart';
import '../pages/details/details_page.dart';
import '../pages/favourites/favourites_page.dart';
import '../pages/home/home_page.dart';
import '../pages/model/model_page.dart';
import '../pages/furniture_list/furniture_list_page.dart';
import '../pages/ar/ar_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      initial: true,
      path: "/",
      children:
        [
          AutoRoute(
            page: FurnitureListRoute.page,
            path: "furniture",
          ),
          AutoRoute(
            page: FavouritesRoute.page,
            path: "favourites",
          ),
        ],
    ),
    AutoRoute(
      page: DetailsRoute.page,
      path: "/details",
    ),
    AutoRoute(
      page: ModelRoute.page,
      path: "/model",
    ),
    AutoRoute(
      page: ArRoute.page,
      path: "/ar",
    ),
  ];
}
