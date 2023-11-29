import 'package:flutter/material.dart';
import 'package:ar_furniture/domain/models/furniture_type.dart';
import 'package:ar_furniture/ui/routes/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ar_furniture/ui/custom_icons/page_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ar_furniture/domain/blocs/favourites_page/favourites_page_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        FurnitureListRoute(furnitureType: const FloorFurniture()),
        FurnitureListRoute(furnitureType: const WallFurniture()),
        FurnitureListRoute(furnitureType: const CeilingFurniture()),
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
