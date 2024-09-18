import 'package:http/http.dart' as http;

import '../shared/shared_preferences_helper.dart';


class Interceptor {
  final SharedPreferencesHelper _sharedPreferencesHelper;

  Interceptor(this._sharedPreferencesHelper);

  Future<void> addAuthHeader(http.Request request) async {
    final token = await _sharedPreferencesHelper.getString('authToken');
    if (token != null) {
      request.headers['Authorization'] = 'Bearer $token';
    }
  }

// Add other interception methods if needed
}
