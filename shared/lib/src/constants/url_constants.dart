import '../../shared.dart';

class UrlConstants {
  const UrlConstants._();

  /// Url
  static const termUrl = 'https://www.chatwork.com/';
  static const lineApiBaseUrl = 'https://api.line.me/';
  static const twitterApiBaseUrl = 'https://api.twitter.com/';
  static const goongApiBaseUrl = 'https://rsapi.goong.io/';
  static const firebaseStorageBaseUrl =
      'https://firebasestorage.googleapis.com/';
  static const randomUserBaseUrl = 'https://randomuser.me/api/';

  static const mockApiBaseUrl = 'https://api.jsonbin.io/';

  /// Path
  static const remoteConfigPath = '/config/RemoteConfig.json';
  static const settingsPath = '/mypage/settings';

  static String get appApiBaseUrl {
    switch (EnvConstants.flavor) {
      case Flavor.develop:
        return 'https://api.dev.example.com/api';
      case Flavor.qa:
        return 'https://api.qa.example.com/api';
      case Flavor.staging:
        return 'https://api.staging.example.com/api';
      case Flavor.production:
        return 'https://api.example.com/api';
    }
  }
}
