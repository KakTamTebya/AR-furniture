import 'package:flutter/material.dart';
import 'package:ar_furniture/models/furniture_type.dart';
import 'package:ar_furniture/routes/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ar_furniture/custom_icons/page_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ar_furniture/blocs/favourites_page/favourites_page_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ar_furniture/repositories/furniture/abstract_furniture_repository.dart';
import 'package:ar_furniture/repositories/favourites/abstract_favourites_repository.dart';

@RoutePage()
class HomePage extends StatelessWidget implements AutoRouteWrapper {

  const HomePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouritesPageBloc(
        abstractFurnitureRepository: GetIt.I<AbstractFurnitureRepository>(),
        abstractFavouritesRepository: GetIt.I<AbstractFavouritesRepository>(),
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        FurnitureListRoute(furnitureType: FloorFurniture()),
        FurnitureListRoute(furnitureType: WallFurniture()),
        FurnitureListRoute(furnitureType: CeilingFurniture()),
        const FavouritesRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              if (index == 3) {
                BlocProvider.of<FavouritesPageBloc>(context)
                    .add(const LoadFavouritesPage());
              }
              tabsRouter.setActiveIndex(index);
              },
            items: const [
              BottomNavigationBarItem(
                  label: "FloorPlaced", icon: Icon(PageIcons.armchair)),
              BottomNavigationBarItem(
                  label: "WallPlaced", icon: Icon(PageIcons.book_shelf)),
              BottomNavigationBarItem(
                  label: "CeilingPlaced", icon: Icon(PageIcons.chandelier)),
              BottomNavigationBarItem(
                  label: "Favourites", icon: Icon(Icons.favorite)),
            ],
          ),
        );
      },
    );
  }
}
