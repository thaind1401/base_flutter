import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAppPreferences extends Mock implements AppPreferences {}

class MockLanguageCodeDataMapper extends Mock
    implements LanguageCodeDataMapper {}

class MockConnectivityService extends Mock
    implements ConnectivityServiceInterface {}

void main() {
  late SettingsRepository settingsRepository;
  final _mockAppPreferences = MockAppPreferences();
  final _mockLanguageCodeDataMapper = MockLanguageCodeDataMapper();
  final _mockConnectivityService = MockConnectivityService();

  setUp(() {
    settingsRepository = SettingsRepositoryImpl(
      _mockAppPreferences,
      _mockLanguageCodeDataMapper,
      _mockConnectivityService,
    );
  });

  group('SettingsRepository Tests', () {
    group('test `repositoryName` function', () {
      test('should return SettingsRepository', () {
        // act
        final result = settingsRepository.repositoryName;
        // assert
        expect(result, 'SettingsRepository');
      });
    });

    group('test `isDarkMode` function', () {
      test('should return true when dark mode is enabled', () {
        // arrange
        when(() => _mockAppPreferences.isDarkMode).thenReturn(true);
        // act
        final result = settingsRepository.isDarkMode;
        // assert
        expect(result, true);
      });

      test('should return false when dark mode is disabled', () {
        // arrange
        when(() => _mockAppPreferences.isDarkMode).thenReturn(false);
        // act
        final result = settingsRepository.isDarkMode;
        // assert
        expect(result, false);
      });
    });

    group('test `isFirstLaunchApp` function', () {
      test('should return true for first launch', () {
        // arrange
        when(() => _mockAppPreferences.isFirstLaunchApp).thenReturn(true);
        // act
        final result = settingsRepository.isFirstLaunchApp;
        // assert
        expect(result, true);
      });
    });
  });
}
