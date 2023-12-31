import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ar_furniture/domain/blocs/furniture_list_page/furniture_list_page_bloc.dart';
import 'package:ar_furniture/domain/models/models.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ar_furniture/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ar_furniture/domain/repositories/furniture/abstract_furniture_repository.dart';
import 'components/furniture_list_page_item.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'components/furniture_list_page_shimmer.dart';

@RoutePage()
class FurnitureListPage extends StatelessWidget implements AutoRouteWrapper {

  final FurnitureType furnitureType;

  const FurnitureListPage({
    required this.furnitureType,
    super.key
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      FurnitureListPageBloc(
          abstractFurnitureRepository: GetIt.I<AbstractFurnitureRepository>(),
          furnitureType: furnitureType)
        ..add(const LoadFurnitureList()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RefreshIndicator(
      onRefresh: () async {
        final completer = Completer();
        BlocProvider.of<FurnitureListPageBloc>(context)
            .add(LoadFurnitureList(completer: completer));
        return completer.future;
      },
      child: CustomScrollView(
        restorationId: furnitureType.getCollectionName(),
        slivers: [
          SliverAppBar(
            title: Text(furnitureType.toString()),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(2),
                child: Divider(
                  height: 1,
                  color: theme.primaryColor.withOpacity(0.7),
                )
            ),
          ),
          BlocBuilder<FurnitureListPageBloc, FurnitureListPageState>(
            builder: (context, state) {
              if (state is FurnitureListPageLoaded) {
                final items = state.furnitureItems;
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding)
                      .copyWith(top: 15),
                  sliver: SliverDynamicHeightGridView(
                    key: PageStorageKey(furnitureType.getCollectionName()),
                    itemCount: items.length,
                    crossAxisCount: 2,
                    crossAxisSpacing: defaultPadding,
                    mainAxisSpacing: 5,
                    builder: (context, index) => FurnitureListPageItem(
                        furnitureItem: items[index]
                    ),
                  ),
                );
              }
              if (state is FurnitureListPageLoadingFail) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text(state.exception.toString())
                  ),
                );
              }
              return SliverPadding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding)
                    .copyWith(top: 15),
                sliver: SliverDynamicHeightGridView(
                  key: PageStorageKey(furnitureType.getCollectionName()),
                  itemCount: 8,
                  crossAxisCount: 2,
                  crossAxisSpacing: defaultPadding,
                  mainAxisSpacing: 5,
                  builder: (context, index) => const FurnitureListPageShimmer(),
                ),
              );
            },
          ),
        ],
      )
    );
  }
}
