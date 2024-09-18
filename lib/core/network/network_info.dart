import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  Future<bool> get isConnected async {
    final result = await Connectivity().checkConnectivity();
    print('Connectivity check: $result');

    // Handle the result if it's a list
    for (var connectivity in result) {
      if (connectivity == ConnectivityResult.mobile || connectivity == ConnectivityResult.wifi) {
        print('Connected via mobile or wifi');
        return true;
      }
    }
    print('No internet connection in list');
    return false;
    }
}
