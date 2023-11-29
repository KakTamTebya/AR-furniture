import 'package:flutter/material.dart';
import 'package:ar_furniture/domain/models/furniture_item.dart';
import 'package:ar_furniture/constants.dart';
import 'package:ar_furniture/ui/routes/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ar_furniture/domain/blocs/favourites_page/favourites_page_bloc.dart';

class FavouritesPageItem extends StatelessWidget {
  final FurnitureItem furnitureItem;
  final bool isFavourite;

  const FavouritesPageItem({
    required this.furnitureItem,
    required this.isFavourite,
    super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final favouriteIconColor = isFavourite
        ? Colors.red
        : theme.hintColor;
    final bloc = BlocProvider.of<FavouritesPageBloc>(context);
    return GestureDetector(
      onTap: () => context.router.push(DetailsRoute(
          furnitureItem: furnitureItem)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultCircularRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(defaultCircularRadius),
              child: Image.network(furnitureItem.menuImageUrl), // mock
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(defaultCircularRadius / 2),
                ),
                child: Text(
                  furnitureItem.name,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(width: 15),
            IconButton(
              icon: const Icon(
                Icons.favorite,
                size: 35,
              ),
              color: favouriteIconColor,
              onPressed: () => {
                bloc.add(favouriteIconColor == Colors.red
                  ? RemoveFavourite(furnitureItem: furnitureItem)
                  : AddFavourite(furnitureItem: furnitureItem))
              },
            ),
          ],
        ),
      ),
    );
  }
}
