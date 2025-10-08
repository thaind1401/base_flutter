// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/data.dart' as _i18;
import 'package:data/src/di/di.dart' as _i38;
import 'package:data/src/repository/repository_impl.dart' as _i37;
import 'package:data/src/repository/source/api/app_api_service.dart' as _i35;
import 'package:data/src/repository/source/api/client/auth_app_server_api_client.dart'
    as _i34;
import 'package:data/src/repository/source/api/client/none_auth_app_server_api_client.dart'
    as _i19;
import 'package:data/src/repository/source/api/client/random_user_api_client.dart'
    as _i21;
import 'package:data/src/repository/source/api/client/raw_api_client.dart'
    as _i22;
import 'package:data/src/repository/source/api/client/refresh_token_api_client.dart'
    as _i31;
import 'package:data/src/repository/source/api/mapper/api_image_url_data_mapper.dart'
    as _i3;
import 'package:data/src/repository/source/api/mapper/api_notification_data_mapper.dart'
    as _i4;
import 'package:data/src/repository/source/api/mapper/api_token_data_mapper.dart'
    as _i5;
import 'package:data/src/repository/source/api/mapper/api_user_data_mapper.dart'
    as _i27;
import 'package:data/src/repository/source/api/mapper/base/base_error_response_mapper/firebase_storage_error_response_mapper.dart'
    as _i7;
import 'package:data/src/repository/source/api/mapper/base/base_error_response_mapper/goong_error_response_mapper.dart'
    as _i9;
import 'package:data/src/repository/source/api/mapper/base/base_error_response_mapper/json_array_error_response_mapper.dart'
    as _i12;
import 'package:data/src/repository/source/api/mapper/base/base_error_response_mapper/json_object_error_response_mapper.dart'
    as _i13;
import 'package:data/src/repository/source/api/mapper/base/base_error_response_mapper/line_error_response_mapper.dart'
    as _i15;
import 'package:data/src/repository/source/api/mapper/base/base_error_response_mapper/server_graphql_error_mapper.dart'
    as _i23;
import 'package:data/src/repository/source/api/mapper/base/base_error_response_mapper/twitter_error_response_mapper.dart'
    as _i26;
import 'package:data/src/repository/source/api/middleware/access_token_interceptor.dart'
    as _i30;
import 'package:data/src/repository/source/api/middleware/connectivity_interceptor.dart'
    as _i6;
import 'package:data/src/repository/source/api/middleware/header_interceptor.dart'
    as _i10;
import 'package:data/src/repository/source/api/middleware/refresh_token_interceptor.dart'
    as _i33;
import 'package:data/src/repository/source/api/refresh_token_api_service.dart'
    as _i32;
import 'package:data/src/repository/source/database/app_database.dart' as _i28;
import 'package:data/src/repository/source/database/mapper/local_image_url_data_mapper.dart'
    as _i16;
import 'package:data/src/repository/source/database/mapper/local_user_data_mapper.dart'
    as _i17;
import 'package:data/src/repository/source/preference/app_preferences.dart'
    as _i29;
import 'package:data/src/repository/source/preference/mapper/preference_user_data_mapper.dart'
    as _i20;
import 'package:data/src/repository/source/shared/mapper/gender_data_mapper.dart'
    as _i8;
import 'package:data/src/repository/source/shared/mapper/language_code_data_mapper.dart'
    as _i14;
import 'package:domain/domain.dart' as _i36;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:objectbox/objectbox.dart' as _i25;
import 'package:shared/shared.dart' as _i11;
import 'package:shared_preferences/shared_preferences.dart' as _i24;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final serviceModule = _$ServiceModule();
    gh.factory<_i3.ApiImageUrlDataMapper>(() => _i3.ApiImageUrlDataMapper());
    gh.factory<_i4.ApiNotificationDataMapper>(
        () => _i4.ApiNotificationDataMapper());
    gh.factory<_i5.ApiTokenDataMapper>(() => _i5.ApiTokenDataMapper());
    gh.factory<_i6.ConnectivityInterceptor>(
        () => _i6.ConnectivityInterceptor());
    gh.factory<_i7.FirebaseStorageErrorResponseMapper>(
        () => _i7.FirebaseStorageErrorResponseMapper());
    gh.factory<_i8.GenderDataMapper>(() => _i8.GenderDataMapper());
    gh.factory<_i9.GoongErrorResponseMapper>(
        () => _i9.GoongErrorResponseMapper());
    gh.factory<_i10.HeaderInterceptor>(
        () => _i10.HeaderInterceptor(gh<_i11.AppInfo>()));
    gh.factory<_i12.JsonArrayErrorResponseMapper>(
        () => _i12.JsonArrayErrorResponseMapper());
    gh.factory<_i13.JsonObjectErrorResponseMapper>(
        () => _i13.JsonObjectErrorResponseMapper());
    gh.factory<_i14.LanguageCodeDataMapper>(
        () => _i14.LanguageCodeDataMapper());
    gh.factory<_i15.LineErrorResponseMapper>(
        () => _i15.LineErrorResponseMapper());
    gh.factory<_i16.LocalImageUrlDataMapper>(
        () => _i16.LocalImageUrlDataMapper());
    gh.factory<_i17.LocalUserDataMapper>(() => _i17.LocalUserDataMapper(
          gh<_i18.GenderDataMapper>(),
          gh<_i18.LocalImageUrlDataMapper>(),
        ));
    gh.lazySingleton<_i19.NoneAuthAppServerApiClient>(
        () => _i19.NoneAuthAppServerApiClient(gh<_i18.HeaderInterceptor>()));
    gh.factory<_i20.PreferenceUserDataMapper>(
        () => _i20.PreferenceUserDataMapper());
    gh.lazySingleton<_i21.RandomUserApiClient>(
        () => _i21.RandomUserApiClient());
    gh.lazySingleton<_i22.RawApiClient>(() => _i22.RawApiClient());
    gh.factory<_i23.ServerGraphQLErrorMapper>(
        () => const _i23.ServerGraphQLErrorMapper());
    await gh.factoryAsync<_i24.SharedPreferences>(
      () => serviceModule.prefs,
      preResolve: true,
    );
    await gh.factoryAsync<_i25.Store>(
      () => serviceModule.getStore(),
      preResolve: true,
    );
    gh.factory<_i26.TwitterErrorResponseMapper>(
        () => _i26.TwitterErrorResponseMapper());
    gh.factory<_i27.ApiUserDataMapper>(() => _i27.ApiUserDataMapper(
          gh<_i18.GenderDataMapper>(),
          gh<_i18.ApiImageUrlDataMapper>(),
        ));
    gh.lazySingleton<_i28.AppDatabase>(
        () => _i28.AppDatabase(gh<_i25.Store>()));
    gh.lazySingleton<_i29.AppPreferences>(
        () => _i29.AppPreferences(gh<_i24.SharedPreferences>()));
    gh.factory<_i30.AccessTokenInterceptor>(
        () => _i30.AccessTokenInterceptor(gh<_i18.AppPreferences>()));
    gh.lazySingleton<_i31.RefreshTokenApiClient>(
        () => _i31.RefreshTokenApiClient(
              gh<_i18.HeaderInterceptor>(),
              gh<_i18.AccessTokenInterceptor>(),
            ));
    gh.lazySingleton<_i32.RefreshTokenApiService>(
        () => _i32.RefreshTokenApiService(gh<_i18.RefreshTokenApiClient>()));
    gh.factory<_i33.RefreshTokenInterceptor>(() => _i33.RefreshTokenInterceptor(
          gh<_i18.AppPreferences>(),
          gh<_i18.RefreshTokenApiService>(),
          gh<_i18.NoneAuthAppServerApiClient>(),
        ));
    gh.lazySingleton<_i34.AuthAppServerApiClient>(
        () => _i34.AuthAppServerApiClient(
              gh<_i18.HeaderInterceptor>(),
              gh<_i18.AccessTokenInterceptor>(),
              gh<_i18.RefreshTokenInterceptor>(),
            ));
    gh.lazySingleton<_i35.AppApiService>(() => _i35.AppApiService(
          gh<_i18.NoneAuthAppServerApiClient>(),
          gh<_i18.AuthAppServerApiClient>(),
          gh<_i18.RandomUserApiClient>(),
        ));
    gh.lazySingleton<_i36.Repository>(() => _i37.RepositoryImpl(
          gh<_i18.AppApiService>(),
          gh<_i18.AppPreferences>(),
          gh<_i18.AppDatabase>(),
          gh<_i18.PreferenceUserDataMapper>(),
          gh<_i18.ApiUserDataMapper>(),
          gh<_i18.LanguageCodeDataMapper>(),
          gh<_i18.GenderDataMapper>(),
          gh<_i18.LocalUserDataMapper>(),
        ));
    return this;
  }
}

class _$ServiceModule extends _i38.ServiceModule {}
