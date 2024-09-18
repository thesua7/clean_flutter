import 'package:http/http.dart' as http;

import '../shared/shared_preferences_helper.dart';

class Interceptor {
  final SharedPreferencesHelper _sharedPreferencesHelper;

  Interceptor(this._sharedPreferencesHelper);

  Future<void> addAuthHeader(http.BaseRequest request) async {
    final token = await _sharedPreferencesHelper.getString('token');
    print("Token interceptor: $token"); // Verify the token
    if (token != null) {
      request.headers['Authorization'] = 'Bearer $token';
    }
  }
}
