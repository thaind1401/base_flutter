import 'dart:async';

/// Abstract interface for connectivity service to allow for testing
abstract interface class ConnectivityServiceInterface {
  /// Returns current connectivity status
  Future<bool> get isConnected;

  /// Stream of connectivity status changes
  Stream<bool> get onConnectivityChanged;
}
