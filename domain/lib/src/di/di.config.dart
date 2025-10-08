// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/domain.dart' as _i4;
import 'package:domain/src/usecase/clear_current_user_data_use_case.dart'
    as _i3;
import 'package:domain/src/usecase/fake_login_use_case.dart' as _i5;
import 'package:domain/src/usecase/forgot_password_use_case.dart' as _i6;
import 'package:domain/src/usecase/get_initial_app_data_use_case.dart' as _i7;
import 'package:domain/src/usecase/get_initial_home_data_use_case.dart' as _i8;
import 'package:domain/src/usecase/get_users_use_case.dart' as _i9;
import 'package:domain/src/usecase/is_logged_in_use_case.dart' as _i10;
import 'package:domain/src/usecase/load_initial_resource_use_case.dart' as _i11;
import 'package:domain/src/usecase/load_more_users_use_case.dart' as _i12;
import 'package:domain/src/usecase/login_use_case.dart' as _i13;
import 'package:domain/src/usecase/logout_use_case.dart' as _i14;
import 'package:domain/src/usecase/register_account_use_case.dart' as _i15;
import 'package:domain/src/usecase/reset_password_use_case.dart' as _i16;
import 'package:domain/src/usecase/save_is_dark_mode_use_case.dart' as _i17;
import 'package:domain/src/usecase/save_is_first_launch_app_use_case.dart'
    as _i18;
import 'package:domain/src/usecase/save_language_code_use_case.dart' as _i19;
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
    gh.factory<_i3.ClearCurrentUserDataUseCase>(
        () => _i3.ClearCurrentUserDataUseCase(gh<_i4.Repository>()));
    gh.factory<_i5.FakeLoginUseCase>(() => _i5.FakeLoginUseCase(
          gh<_i4.AppNavigator>(),
          gh<_i4.Repository>(),
        ));
    gh.factory<_i6.ForgotPasswordUseCase>(
        () => _i6.ForgotPasswordUseCase(gh<_i4.Repository>()));
    gh.factory<_i7.GetInitialAppDataUseCase>(
        () => _i7.GetInitialAppDataUseCase(gh<_i4.Repository>()));
    gh.factory<_i8.GetInitialHomeDataUseCase>(
        () => _i8.GetInitialHomeDataUseCase(gh<_i4.Repository>()));
    gh.factory<_i9.GetUsersUseCase>(
        () => _i9.GetUsersUseCase(gh<_i4.Repository>()));
    gh.factory<_i10.IsLoggedInUseCase>(
        () => _i10.IsLoggedInUseCase(gh<_i4.Repository>()));
    gh.factory<_i11.LoadInitialResourceUseCase>(
        () => _i11.LoadInitialResourceUseCase(gh<_i4.Repository>()));
    gh.factory<_i12.LoadMoreUsersUseCase>(
        () => _i12.LoadMoreUsersUseCase(gh<_i4.Repository>()));
    gh.factory<_i13.LoginUseCase>(
        () => _i13.LoginUseCase(gh<_i4.Repository>()));
    gh.factory<_i14.LogoutUseCase>(() => _i14.LogoutUseCase(
          gh<_i4.Repository>(),
          gh<_i4.AppNavigator>(),
        ));
    gh.factory<_i15.RegisterAccountUseCase>(
        () => _i15.RegisterAccountUseCase(gh<_i4.Repository>()));
    gh.factory<_i16.ResetPasswordUseCase>(
        () => _i16.ResetPasswordUseCase(gh<_i4.Repository>()));
    gh.factory<_i17.SaveIsDarkModeUseCase>(
        () => _i17.SaveIsDarkModeUseCase(gh<_i4.Repository>()));
    gh.factory<_i18.SaveIsFirstLaunchAppUseCase>(
        () => _i18.SaveIsFirstLaunchAppUseCase(gh<_i4.Repository>()));
    gh.factory<_i19.SaveLanguageCodeUseCase>(
        () => _i19.SaveLanguageCodeUseCase(gh<_i4.Repository>()));
    return this;
  }
}
