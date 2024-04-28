import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:seat_selling_app/core/utils/constants.dart';

/// Authentication method is not implemented for simplicity,
/// but we can get the token from login service and set it in our next
/// requests.
class Request {
  final Dio _dio = Dio();
  Request() {
    updateDioInterceptors();
  }

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

  Future<Response> get(String path) async {
    return await _dio.get(path);
  }

  Future<Response> post(String path, {Object? data}) async {
    return await _dio.post(path, data: data);
  }
}
