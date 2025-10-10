// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../data.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this._appApiService,
    this._appPreferences,
    this._preferenceUserDataMapper,
    this._genderDataMapper,
  );

  final AppApiService _appApiService;
  final AppPreferences _appPreferences;
  final PreferenceUserDataMapper _preferenceUserDataMapper;
  final GenderDataMapper _genderDataMapper;

  // BaseRepository implementations
  @override
  String get repositoryName => 'AuthRepository';

  @override
  bool get isConnected => true; // TODO: Implement real connectivity check

  @override
  Stream<bool> get onConnectivityChanged =>
      // Connectivity().onConnectivityChanged.map((event) => event != ConnectivityResult.none);
      Stream.value(true); // Temporary: always return connected

  @override
  Future<void> clearCache() async {
    await _appPreferences.clearCurrentUserData();
  }

  // AuthRepository specific implementations
  @override
  Future<bool> get isLoggedIn => _appPreferences.isLoggedIn;

  @override
  bool get isFirstLogin => _appPreferences.isFirstLogin;

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    final response = await _appApiService.login(email: email, password: password);
    await Future.wait([
      saveAccessToken(response?.data?.accessToken ?? ''),
      saveUserPreference(
        User(
          id: response?.data?.id ?? -1,
          email: response?.data?.email ?? '',
        ),
      ),
    ]);
  }

  @override
  Future<void> logout() async {
    await _appApiService.logout();
    await _appPreferences.clearCurrentUserData();
  }

  @override
  Future<void> resetPassword({
    required String token,
    required String email,
    required String password,
    required String confirmPassword,
  }) =>
      _appApiService.resetPassword(
        token: token,
        email: email,
        password: password,
      );

  @override
  Future<void> forgotPassword(String email) => 
      _appApiService.forgotPassword(email);

  @override
  Future<void> register({
    required String username,
    required String email,
    required String password,
    required Gender gender,
  }) async {
    final response = await _appApiService.register(
      username: username,
      email: email,
      password: password,
      gender: _genderDataMapper.mapToData(gender),
    );
    await Future.wait([
      saveAccessToken(response?.data?.accessToken ?? ''),
      saveUserPreference(
        User(
          id: response?.data?.id ?? -1,
          email: response?.data?.email ?? '',
        ),
      ),
    ]);
  }

  @override
  User getUserPreference() => 
      _preferenceUserDataMapper.mapToEntity(_appPreferences.currentUser);

  @override
  Future<void> clearCurrentUserData() => 
      _appPreferences.clearCurrentUserData();

  @override
  Future<bool> saveIsFirstLogin(bool isFirstLogin) {
    return _appPreferences.saveIsFirstLogin(isFirstLogin);
  }

  @override
  Future<void> saveAccessToken(String accessToken) => 
      _appPreferences.saveAccessToken(accessToken);

  @override
  Future<bool> saveUserPreference(User user) =>
      _appPreferences.saveCurrentUser(_preferenceUserDataMapper.mapToData(user));
}