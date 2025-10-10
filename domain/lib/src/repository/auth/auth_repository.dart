import '../../../domain.dart';
import '../base/base_repository.dart';

abstract class AuthRepository extends BaseRepository {
  /// Returns true if user has valid authentication token
  Future<bool> get isLoggedIn;
  
  /// Returns true if this is user's first login
  bool get isFirstLogin;

  /// Authenticates user with email and password
  /// Throws [AuthenticationException] if credentials are invalid
  Future<void> login({
    required String email,
    required String password,
  });

  /// Registers new user account
  /// Throws [RegistrationException] if registration fails
  Future<void> register({
    required String username,
    required String email,
    required String password,
    required Gender gender,
  });

  /// Logs out current user and clears authentication data
  Future<void> logout();

  /// Resets user password with reset token
  Future<void> resetPassword({
    required String token,
    required String email,
    required String password,
    required String confirmPassword,
  });

  /// Sends forgot password email
  Future<void> forgotPassword(String email);

  /// Saves authentication token securely
  Future<void> saveAccessToken(String accessToken);

  /// Clears all current user data and tokens
  Future<void> clearCurrentUserData();

  /// Gets current user preferences
  User getUserPreference();

  /// Saves user preference data
  Future<bool> saveUserPreference(User user);

  /// Saves first login status
  Future<bool> saveIsFirstLogin(bool isFirstLogin);
}