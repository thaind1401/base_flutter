import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAppApiService extends Mock implements AppApiService {}

class MockAppPreferences extends Mock implements AppPreferences {}

class MockPreferenceUserDataMapper extends Mock implements PreferenceUserDataMapper {}

class MockGenderDataMapper extends Mock implements GenderDataMapper {}

void main() {
  late AuthRepository authRepository;
  final _mockAppApiService = MockAppApiService();
  final _mockAppPreferences = MockAppPreferences();
  final _mockPreferenceUserDataMapper = MockPreferenceUserDataMapper();
  final _mockGenderDataMapper = MockGenderDataMapper();

  setUp(() {
    authRepository = AuthRepositoryImpl(
      _mockAppApiService,
      _mockAppPreferences,
      _mockPreferenceUserDataMapper,
      _mockGenderDataMapper,
    );
  });

  group('AuthRepository Tests', () {
    group('test `isLoggedIn` function', () {
      test('should return true when `_appPreferences.isLoggedIn` is true', () async {
        // arrange
        when(() => _mockAppPreferences.isLoggedIn).thenReturn(true);
        // act
        final result = authRepository.isLoggedIn;
        // assert
        expect(result, true);
      });
      
      test('should return false when `_appPreferences.isLoggedIn` is false', () async {
        // arrange
        when(() => _mockAppPreferences.isLoggedIn).thenReturn(false);
        // act
        final result = authRepository.isLoggedIn;
        // assert
        expect(result, false);
      });
    });
    
    group('test `repositoryName` function', () {
      test('should return AuthRepository', () {
        // act
        final result = authRepository.repositoryName;
        // assert
        expect(result, 'AuthRepository');
      });
    });
  });
}
