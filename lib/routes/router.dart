import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../models/furniture_item.dart';
import '../models/furniture_type.dart';
import '../ui/pages/details/details_page.dart';
import '../ui/pages/favourites/favourites_page.dart';
import '../ui/pages/home/home_page.dart';
import '../ui/pages/model/model_page.dart';
import '../ui/pages/furniture_list/furniture_list_page.dart';

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
            path: "favourites"
          ),
        ]
    ),
    AutoRoute(
      page: DetailsRoute.page,
      path: "/details"
    ),
    AutoRoute(
      page: ModelRoute.page,
      path: "/model"
    ),
  ];
}