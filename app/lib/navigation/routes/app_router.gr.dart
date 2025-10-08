// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app/navigation/routes/app_router.dart' as _i2;
import 'package:app/ui/home/home_page.dart' as _i1;
import 'package:app/ui/item_detail/item_detail_page.dart' as _i3;
import 'package:app/ui/login/login_page.dart' as _i4;
import 'package:app/ui/main/main_page.dart' as _i5;
import 'package:app/ui/my_page/my_page_page.dart' as _i6;
import 'package:app/ui/search/search_page.dart' as _i7;
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:domain/domain.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    HomeTab.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeTabPage(),
      );
    },
    ItemDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ItemDetailRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ItemDetailPage(
          user: args.user,
          key: args.key,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MainPage(),
      );
    },
    MyPageRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MyPagePage(),
      );
    },
    MyPageTab.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MyPageTabPage(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SearchPage(),
      );
    },
    SearchTab.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SearchTabPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeTabPage]
class HomeTab extends _i8.PageRouteInfo<void> {
  const HomeTab({List<_i8.PageRouteInfo>? children})
      : super(
          HomeTab.name,
          initialChildren: children,
        );

  static const String name = 'HomeTab';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ItemDetailPage]
class ItemDetailRoute extends _i8.PageRouteInfo<ItemDetailRouteArgs> {
  ItemDetailRoute({
    required _i9.User user,
    _i10.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ItemDetailRoute.name,
          args: ItemDetailRouteArgs(
            user: user,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ItemDetailRoute';

  static const _i8.PageInfo<ItemDetailRouteArgs> page =
      _i8.PageInfo<ItemDetailRouteArgs>(name);
}

class ItemDetailRouteArgs {
  const ItemDetailRouteArgs({
    required this.user,
    this.key,
  });

  final _i9.User user;

  final _i10.Key? key;

  @override
  String toString() {
    return 'ItemDetailRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MainPage]
class MainRoute extends _i8.PageRouteInfo<void> {
  const MainRoute({List<_i8.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MyPagePage]
class MyPageRoute extends _i8.PageRouteInfo<void> {
  const MyPageRoute({List<_i8.PageRouteInfo>? children})
      : super(
          MyPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyPageRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MyPageTabPage]
class MyPageTab extends _i8.PageRouteInfo<void> {
  const MyPageTab({List<_i8.PageRouteInfo>? children})
      : super(
          MyPageTab.name,
          initialChildren: children,
        );

  static const String name = 'MyPageTab';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SearchPage]
class SearchRoute extends _i8.PageRouteInfo<void> {
  const SearchRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SearchTabPage]
class SearchTab extends _i8.PageRouteInfo<void> {
  const SearchTab({List<_i8.PageRouteInfo>? children})
      : super(
          SearchTab.name,
          initialChildren: children,
        );

  static const String name = 'SearchTab';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
