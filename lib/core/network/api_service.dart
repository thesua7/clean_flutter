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

  // GET request method
  Future<http.Response> get(String url) async {
    // Check for internet connectivity

    if (!await _networkInfo.isConnected) {
      print('No internet connection'); // Log no connectivity case
      throw NetworkException('No internet connection');
    }

    // Create a fresh request
    final request = http.Request('GET', Uri.parse(url));
    // Add authentication header
    await _interceptor.addAuthHeader(request);
    final streamedResponse = await _timeoutInterceptor
          .sendWithTimeout(request, _client); // Added timeout handling

      // Get the full response from the stream
      final response = await http.Response.fromStream(streamedResponse);

      // Log response status code
      print('Response Status Code: ${response.statusCode}');

      // Handle the response
      return _handleResponse(response);
  }

  // POST request method
  Future<http.Response> post(String url, {required Map<String, dynamic> body}) async {
    // Check for internet connectivity
    if (!await _networkInfo.isConnected) {
      print('No internet connection'); // Log no connectivity case
      throw NetworkException('No internet connection');
    }

    // Create a fresh request
    final request = http.Request('POST', Uri.parse(url))
      ..headers['Content-Type'] = 'application/json'
      ..body = jsonEncode(body);

    // Add authentication header
    await _interceptor.addAuthHeader(request);

    // Send request with timeout handling
    final streamedResponse = await _timeoutInterceptor.sendWithTimeout(request, _client);

    // Get the full response from the stream
    final response = await http.Response.fromStream(streamedResponse);

    // Log response status code
    print('Response Status Code: ${response.statusCode}');

    // Handle the response
    return _handleResponse(response);
  }

  // Add other HTTP methods (POST, PUT, DELETE) similarly

  // Private helper method to handle responses
  http.Response _handleResponse(http.Response response) {
    if (response.statusCode >= 400 && response.statusCode < 500) {
      throw NetworkException('Client error: ${response.reasonPhrase}', response.statusCode);
    } else if (response.statusCode >= 500) {
      throw NetworkException('Server error: ${response.reasonPhrase}', response.statusCode);
    }
    return response; // Return the successful response
  }
}


// Add similar methods for other HTTP verbs like POST, PUT, DELETE if needed

