import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

/// Wrapper service for flutter_secure_storage to provide secure storage functionality
/// Used for storing sensitive data like authentication tokens, credentials, etc.
@LazySingleton()
final class AppSecureStorage {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
    lOptions: LinuxOptions(),
    wOptions: WindowsOptions(),
    webOptions: WebOptions(
      dbName: 'FlutterSecureStorage',
      publicKey: 'FlutterSecureStorage',
    ),
  );

  /// Stores a key-value pair securely
  /// 
  /// [key] - The key to store the value under
  /// [value] - The value to store securely
  Future<void> write({
    required String key,
    required String value,
  }) async {
    await _secureStorage.write(key: key, value: value);
  }

  /// Reads a value from secure storage
  /// 
  /// [key] - The key to read the value for
  /// Returns the stored value or null if not found
  Future<String?> read({required String key}) async {
    return await _secureStorage.read(key: key);
  }

  /// Deletes a specific key-value pair from secure storage
  /// 
  /// [key] - The key to delete
  Future<void> delete({required String key}) async {
    await _secureStorage.delete(key: key);
  }

  /// Clears all data from secure storage
  /// Use with caution as this will remove all stored secure data
  Future<void> deleteAll() async {
    await _secureStorage.deleteAll();
  }

  /// Checks if a key exists in secure storage
  /// 
  /// [key] - The key to check for existence
  /// Returns true if the key exists, false otherwise
  Future<bool> containsKey({required String key}) async {
    return await _secureStorage.containsKey(key: key);
  }

  /// Gets all keys stored in secure storage
  /// Returns a map of all key-value pairs
  Future<Map<String, String>> readAll() async {
    return await _secureStorage.readAll();
  }
}