// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app/app.dart' as _i6;
import 'package:app/app/bloc/app_bloc.dart' as _i3;
import 'package:app/base/bloc/common/common_bloc.dart' as _i9;
import 'package:app/helper/local_push_notification_helper.dart' as _i12;
import 'package:app/navigation/app_navigator_impl.dart' as _i18;
import 'package:app/navigation/mapper/app_popup_info_mapper.dart' as _i7;
import 'package:app/navigation/mapper/app_route_info_mapper.dart' as _i8;
import 'package:app/navigation/middleware/route_guard.dart' as _i16;
import 'package:app/navigation/routes/app_router.dart' as _i5;
import 'package:app/ui/home/bloc/home_bloc.dart' as _i10;
import 'package:app/ui/item_detail/bloc/item_detail_bloc.dart' as _i11;
import 'package:app/ui/login/bloc/login_bloc.dart' as _i13;
import 'package:app/ui/main/bloc/main_bloc.dart' as _i14;
import 'package:app/ui/my_page/bloc/my_page_bloc.dart' as _i15;
import 'package:app/ui/search/bloc/search_bloc.dart' as _i17;
import 'package:domain/domain.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AppBloc>(() => _i3.AppBloc(
          gh<_i4.GetInitialAppDataUseCase>(),
          gh<_i4.SaveIsDarkModeUseCase>(),
          gh<_i4.SaveLanguageCodeUseCase>(),
        ));
    gh.lazySingleton<_i5.AppRouter>(() => _i5.AppRouter());
    gh.lazySingleton<_i6.BasePopupInfoMapper>(() => _i7.AppPopupInfoMapper());
    gh.lazySingleton<_i6.BaseRouteInfoMapper>(() => _i8.AppRouteInfoMapper());
    gh.factory<_i9.CommonBloc>(
        () => _i9.CommonBloc(gh<_i4.ClearCurrentUserDataUseCase>()));
    gh.factory<_i10.HomeBloc>(() => _i10.HomeBloc(gh<_i4.GetUsersUseCase>()));
    gh.factory<_i11.ItemDetailBloc>(() => _i11.ItemDetailBloc());
    gh.lazySingleton<_i12.LocalPushNotificationHelper>(
        () => _i12.LocalPushNotificationHelper());
    gh.factory<_i13.LoginBloc>(() => _i13.LoginBloc(
          gh<_i4.LoginUseCase>(),
          gh<_i4.FakeLoginUseCase>(),
        ));
    gh.factory<_i14.MainBloc>(() => _i14.MainBloc());
    gh.factory<_i15.MyPageBloc>(() => _i15.MyPageBloc(gh<_i4.LogoutUseCase>()));
    gh.factory<_i16.RouteGuard>(
        () => _i16.RouteGuard(gh<_i4.IsLoggedInUseCase>()));
    gh.factory<_i17.SearchBloc>(() => _i17.SearchBloc());
    gh.lazySingleton<_i4.AppNavigator>(() => _i18.AppNavigatorImpl(
          gh<_i6.AppRouter>(),
          gh<_i6.BasePopupInfoMapper>(),
          gh<_i6.BaseRouteInfoMapper>(),
        ));
    return this;
  }
}
