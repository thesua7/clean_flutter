import 'dart:async';

import 'package:http/http.dart' as http;

import 'network_exceptions.dart';

class TimeoutInterceptor {
  final Duration _timeout;

  TimeoutInterceptor(this._timeout);

  // Method to handle sending a request with timeout
  Future<http.StreamedResponse> sendWithTimeout(
      http.BaseRequest request, http.Client client) async {
    try {
      // Send request and apply timeout
      return await client.send(request).timeout(_timeout);
    } on TimeoutException {
      throw NetworkException('Request timed out');
    }
  }}