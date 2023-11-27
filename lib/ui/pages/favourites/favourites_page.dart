import 'dart:async';
import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';
import 'package:ar_furniture/blocs/favourites_page/favourites_page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ar_furniture/generated/l10n.dart';
import 'components/favourites_page_item.dart';

@RoutePage()
class FavouritesPage extends StatelessWidget {

  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RefreshIndicator(
      onRefresh: () async {
        final completer = Completer();
        BlocProvider.of<FavouritesPageBloc>(context)
            .add(LoadFavouritesPage(completer: completer));
        return completer.future;
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(S.of(context).favourites),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(2),
                child: Divider(
                  height: 1,
                  color: theme.primaryColor.withOpacity(0.7),
                )
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 15)),
            BlocBuilder<FavouritesPageBloc, FavouritesPageState>(
              builder: (context, state) {
                if (state is FavouritesPageLoaded) {
                  final itemsList = state.items.entries.toList();
                  if (itemsList.isEmpty) {
                    return SliverFillRemaining(
                      child: Center(
                        child: Text(S.of(context).emptyPageMessage),
                      ),
                    );
                  }
                  return SliverList.builder(
                    itemCount: itemsList.length,
                    itemBuilder: (context, index) => FavouritesPageItem(
                        furnitureItem: itemsList[index].key,
                        isFavourite: itemsList[index].value),
                  );
                }
                if (state is FavouritesPageLoadingFail) {
                  debugPrint(state.exception.toString());
                  return SliverFillRemaining(
                    child: Center(
                      child: Text(state.exception.toString()),
                    ),
                  );
                }
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator()
                  )
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
