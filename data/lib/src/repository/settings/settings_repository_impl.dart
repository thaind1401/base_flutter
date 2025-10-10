import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../data.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(
    this._appPreferences,
    this._languageCodeDataMapper,
  );

  final AppPreferences _appPreferences;
  final LanguageCodeDataMapper _languageCodeDataMapper;

  // BaseRepository implementations
  @override
  String get repositoryName => 'SettingsRepository';

  @override
  bool get isConnected => true; // Settings usually work offline

  @override
  Stream<bool> get onConnectivityChanged => Stream.value(true);

  @override
  Future<void> clearCache() async {
    // Clear settings cache if needed
    // For now, we don't clear user preferences
  }

  // SettingsRepository specific implementations
  @override
  bool get isDarkMode => _appPreferences.isDarkMode;
  
  @override
  bool get isFirstLaunchApp => _appPreferences.isFirstLaunchApp;
  
  @override
  LanguageCode get languageCode =>
      _languageCodeDataMapper.mapToEntity(_appPreferences.languageCode);
  
  @override
  String get deviceToken => _appPreferences.deviceToken;

  @override
  Future<bool> saveIsDarkMode(bool isDarkMode) => 
      _appPreferences.saveIsDarkMode(isDarkMode);

  @override
  Future<bool> saveLanguageCode(LanguageCode languageCode) {
    return _appPreferences.saveLanguageCode(
      _languageCodeDataMapper.mapToData(languageCode),
    );
  }

  @override
  Future<bool> saveIsFirstLaunchApp(bool isFirstLaunchApp) {
    return _appPreferences.saveIsFirsLaunchApp(isFirstLaunchApp);
  }

  @override
  Future<bool> saveDeviceToken(String token) => 
      _appPreferences.saveDeviceToken(token);
}