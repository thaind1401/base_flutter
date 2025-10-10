/// Base repository containing common functionality for all repositories
abstract class BaseRepository {
  /// Stream that emits connectivity status changes
  /// All repositories can check network connectivity
  Stream<bool> get onConnectivityChanged;
  
  /// Returns current connectivity status
  /// Useful for offline/online behavior
  bool get isConnected;
  
  /// Clears all cached data for this repository
  /// Common cleanup functionality
  Future<void> clearCache();
  
  /// Returns repository name for logging purposes
  /// Each repository should override this
  String get repositoryName;
}