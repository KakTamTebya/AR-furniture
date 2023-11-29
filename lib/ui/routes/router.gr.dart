// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ArRoute.name: (routeData) {
      final args = routeData.argsAs<ArRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ArPage(
          key: args.key,
          glbUrl: args.glbUrl,
        ),
      );
    },
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: DetailsPage(
          furnitureItem: args.furnitureItem,
          key: args.key,
        )),
      );
    },
    FavouritesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavouritesPage(),
      );
    },
    FurnitureListRoute.name: (routeData) {
      final args = routeData.argsAs<FurnitureListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: FurnitureListPage(
          furnitureType: args.furnitureType,
          key: args.key,
        )),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    ModelRoute.name: (routeData) {
      final args = routeData.argsAs<ModelRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ModelPage(
          modelUrl: args.modelUrl,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [ArPage]
class ArRoute extends PageRouteInfo<ArRouteArgs> {
  ArRoute({
    Key? key,
    required String glbUrl,
    List<PageRouteInfo>? children,
  }) : super(
          ArRoute.name,
          args: ArRouteArgs(
            key: key,
            glbUrl: glbUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'ArRoute';

  static const PageInfo<ArRouteArgs> page = PageInfo<ArRouteArgs>(name);
}

class ArRouteArgs {
  const ArRouteArgs({
    this.key,
    required this.glbUrl,
  });

  final Key? key;

  final String glbUrl;

  @override
  String toString() {
    return 'ArRouteArgs{key: $key, glbUrl: $glbUrl}';
  }
}

/// generated route for
/// [DetailsPage]
class DetailsRoute extends PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    required FurnitureItem furnitureItem,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DetailsRoute.name,
          args: DetailsRouteArgs(
            furnitureItem: furnitureItem,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static const PageInfo<DetailsRouteArgs> page =
      PageInfo<DetailsRouteArgs>(name);
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    required this.furnitureItem,
    this.key,
  });

  final FurnitureItem furnitureItem;

  final Key? key;

  @override
  String toString() {
    return 'DetailsRouteArgs{furnitureItem: $furnitureItem, key: $key}';
  }
}

/// generated route for
/// [FavouritesPage]
class FavouritesRoute extends PageRouteInfo<void> {
  const FavouritesRoute({List<PageRouteInfo>? children})
      : super(
          FavouritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavouritesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FurnitureListPage]
class FurnitureListRoute extends PageRouteInfo<FurnitureListRouteArgs> {
  FurnitureListRoute({
    required FurnitureType furnitureType,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          FurnitureListRoute.name,
          args: FurnitureListRouteArgs(
            furnitureType: furnitureType,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FurnitureListRoute';

  static const PageInfo<FurnitureListRouteArgs> page =
      PageInfo<FurnitureListRouteArgs>(name);
}

class FurnitureListRouteArgs {
  const FurnitureListRouteArgs({
    required this.furnitureType,
    this.key,
  });

  final FurnitureType furnitureType;

  final Key? key;

  @override
  String toString() {
    return 'FurnitureListRouteArgs{furnitureType: $furnitureType, key: $key}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ModelPage]
class ModelRoute extends PageRouteInfo<ModelRouteArgs> {
  ModelRoute({
    required String modelUrl,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ModelRoute.name,
          args: ModelRouteArgs(
            modelUrl: modelUrl,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ModelRoute';

  static const PageInfo<ModelRouteArgs> page = PageInfo<ModelRouteArgs>(name);
}

class ModelRouteArgs {
  const ModelRouteArgs({
    required this.modelUrl,
    this.key,
  });

  final String modelUrl;

  final Key? key;

  @override
  String toString() {
    return 'ModelRouteArgs{modelUrl: $modelUrl, key: $key}';
  }
}
