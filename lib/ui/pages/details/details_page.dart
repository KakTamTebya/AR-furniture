import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ar_furniture/domain/models/furniture_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ar_furniture/domain/repositories/favourites/abstract_favourites_repository.dart';
import 'components/details_page_body.dart';
import 'package:ar_furniture/ui/reused_widgets/appbar_leading_underline.dart';
import 'package:ar_furniture/domain/blocs/details_page/details_page_bloc.dart';
import 'package:ar_furniture/domain/blocs/favourites_page/favourites_page_bloc.dart';

@RoutePage()
class DetailsPage extends StatelessWidget implements AutoRouteWrapper {

  final FurnitureItem furnitureItem;

  const DetailsPage({
    required this.furnitureItem,
    super.key
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsPageBloc(
          abstractFavouritesRepository: GetIt.I<AbstractFavouritesRepository>(),
          furnitureItemId: furnitureItem.id)..add(LoadDetailsPage()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PopScope(
      onPopInvoked: (_) => BlocProvider.of<FavouritesPageBloc>(context)
          .add(const LoadFavouritesPage()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_sharp, color: theme.primaryColor),
            onPressed: () => {
              BlocProvider.of<FavouritesPageBloc>(context)
                  .add(const LoadFavouritesPage()),
              context.router.pop()
            },
          ),
          titleSpacing: 5,
          title: Text(
            furnitureItem.name,
            maxLines: 2,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: const AppBarLeadingUnderline(),
            ),
          ),
        ),
        body: DetailsPageBody(furnitureItem: furnitureItem),
      ),
    );
  }
}
