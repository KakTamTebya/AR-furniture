import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ar_furniture/generated/l10n.dart';
import 'package:ar_furniture/domain/blocs/favourites_page/favourites_page_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ar_furniture/domain/repositories/furniture/abstract_furniture_repository.dart';
import 'package:ar_furniture/domain/repositories/favourites/abstract_favourites_repository.dart';
import 'routes/router.dart';
import 'package:ar_furniture/ui/theme/theme.dart';


class App extends StatelessWidget {

  final _appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouritesPageBloc(
        abstractFurnitureRepository: GetIt.I<AbstractFurnitureRepository>(),
        abstractFavouritesRepository: GetIt.I<AbstractFavouritesRepository>(),
      ),
      child: MaterialApp.router(
        title: 'AR Furniture',
        debugShowCheckedModeBanner: false,
        theme: theme,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
