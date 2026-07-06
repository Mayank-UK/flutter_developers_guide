import 'package:connectivity_plus/connectivity_plus.dart';

/// Observable network connectivity. The Flutter counterpart to Android's
/// `broadcastreceivers/NetworkConnectivityReceiver`.
///
/// Exposes a boolean online stream so the app can surface offline state or
/// gate network calls. Treats any result other than [ConnectivityResult.none]
/// as online (including mobile/wifi/ethernet/bluetooth/vpn).
class ConnectivityService {
  final Connectivity _connectivity;

  ConnectivityService([Connectivity? connectivity])
      : _connectivity = connectivity ?? Connectivity();

  /// Stream of online/offline state, starting with the current value.
  Stream<bool> get isOnline {
    return _connectivity.onConnectivityChanged.map(_isOnline);
  }

  /// Snapshot of the current connectivity state.
  Future<bool> get currentlyOnline async {
    final result = await _connectivity.checkConnectivity();
    return _isOnline(result);
  }

  bool _isOnline(List<ConnectivityResult> results) {
    if (results.isEmpty) return false;
    return results.any((r) => r != ConnectivityResult.none);
  }
}
