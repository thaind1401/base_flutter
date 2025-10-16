import '../../../domain.dart';
import '../base/base_repository.dart';

abstract interface class SettingsRepository implements BaseRepository {
  /// Returns true if dark mode is enabled
  bool get isDarkMode;

  /// Returns true if this is first app launch
  bool get isFirstLaunchApp;

  /// Returns current app language code
  LanguageCode get languageCode;

  /// Returns device push notification token
  String get deviceToken;

  /// Saves dark mode preference
  /// Returns true if save was successful
  Future<bool> saveIsDarkMode(bool isDarkMode);

  /// Saves app language preference
  /// Returns true if save was successful
  Future<bool> saveLanguageCode(LanguageCode languageCode);

  /// Saves first launch app status
  /// Returns true if save was successful
  Future<bool> saveIsFirstLaunchApp(bool isFirstLaunchApp);

  /// Saves device push notification token
  /// Returns true if save was successful
  Future<bool> saveDeviceToken(String token);
}
