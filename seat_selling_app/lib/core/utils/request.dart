import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:seat_selling_app/core/utils/constants.dart';

/// A class that encapsulates network requests using the `Dio` library.
///
/// Authentication method is not implemented for simplicity,
/// but we can get the token from login service and set it in our next
/// requests.
class Request {
  /// Internal instance of `Dio` used for making HTTP requests.
  final Dio _dio = Dio();

  /// Constructor that initializes the `_dio` instance and configures its interceptors.
  Request() {
    updateDioInterceptors();
  }

  /// Updates the configuration of `_dio` with base URL, error handling, headers, and logging.
  void updateDioInterceptors() {
    _dio.options = BaseOptions(
      baseUrl: Constants.baseApiUrl,
      receiveDataWhenStatusError: true,
      validateStatus: (value) {
        return value! <= 500;
      },
      headers: {
        'Accept': 'application/json',
      },
    );
    _dio
      ..interceptors.add(
        LogInterceptor(
          requestBody: kDebugMode ? true : false,
          responseBody: kDebugMode ? true : false,
          requestHeader: kDebugMode ? true : false,
        ),
      )
      ..interceptors.add(
        InterceptorsWrapper(
          onError: (error, handler) {
            return handler.next(error);
          },
        ),
      );
  }

  /// Performs a GET request to the specified path relative to the base URL.
  ///
  /// Returns a `Future<Response>` containing the server's response.
  Future<Response> get(String path) async {
    return await _dio.get(path);
  }

  /// Performs a POST request to the specified path relative to the base URL.
  ///
  /// Takes an optional `data` argument to be sent in the request body.
  /// Returns a `Future<Response>` containing the server's response.
  Future<Response> post(String path, {Object? data}) async {
    return await _dio.post(path, data: data);
  }
}
