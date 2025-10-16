import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

import 'connectivity_service_interface.dart';

@LazySingleton(as: ConnectivityServiceInterface)
final class ConnectivityService implements ConnectivityServiceInterface {
  ConnectivityService() : _connectivity = Connectivity();

  final Connectivity _connectivity;

  /// Returns current connectivity status
  @override
  Future<bool> get isConnected async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return !connectivityResult.contains(ConnectivityResult.none);
  }

  /// Stream of connectivity status changes
  @override
  Stream<bool> get onConnectivityChanged {
    return _connectivity.onConnectivityChanged.map(
      (List<ConnectivityResult> results) =>
          !results.contains(ConnectivityResult.none),
    );
  }
}
