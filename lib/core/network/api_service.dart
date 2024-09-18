import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'network_exceptions.dart';
import 'network_info.dart';
import 'timeout_interceptor.dart';
import 'interceptors.dart';

class ApiService {
  final http.Client _client;
  final NetworkInfo _networkInfo;
  final TimeoutInterceptor _timeoutInterceptor;
  final Interceptor _interceptor;

  ApiService(
      this._client,
      this._networkInfo,
      this._timeoutInterceptor,
      this._interceptor,
      );

  Future<http.Response> get(String url) async {
    if (!await _networkInfo.isConnected) {
      print('No internet connection');
      throw NetworkException('No internet connection');
    }

    final request = http.Request('GET', Uri.parse(url));

    // Add authentication header
    await _interceptor.addAuthHeader(request);

    print('Request Headers: ${request.headers}'); // Verify headers

    final streamedResponse = await _timeoutInterceptor.sendWithTimeout(request, _client);
    final response = await http.Response.fromStream(streamedResponse);

    print('Response Status Code: ${response.statusCode}');

    return _handleResponse(response);
  }

  Future<http.Response> post(String url, {required Map<String, dynamic> body}) async {
    if (!await _networkInfo.isConnected) {
      print('No internet connection');
      throw NetworkException('No internet connection');
    }

    final request = http.Request('POST', Uri.parse(url))
      ..headers['Content-Type'] = 'application/json'
      ..body = jsonEncode(body);

    await _interceptor.addAuthHeader(request);

    print('Request Headers: ${request.headers}'); // Verify headers

    final streamedResponse = await _timeoutInterceptor.sendWithTimeout(request, _client);
    final response = await http.Response.fromStream(streamedResponse);

    print('Response Status Code: ${response.statusCode}');

    return _handleResponse(response);
  }

  http.Response _handleResponse(http.Response response) {
    if (response.statusCode >= 400 && response.statusCode < 500) {
      throw NetworkException('Client error: ${response.reasonPhrase}', response.statusCode);
    } else if (response.statusCode >= 500) {
      throw NetworkException('Server error: ${response.reasonPhrase}', response.statusCode);
    }
    return response;
  }
}
