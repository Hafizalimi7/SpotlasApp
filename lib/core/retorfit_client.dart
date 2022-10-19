import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


import 'data_service.dart';

const String _baseUrl = "https://dev.api.spotlas.com/";


class RetrofitClientInstance {
  static RetrofitClientInstance _instance = RetrofitClientInstance._internal();
  Dio _dio;
  GetDataService _client;

  RetrofitClientInstance._internal([String authToken = '']) {
    _dio = Dio();
    _dio?.options.responseType = ResponseType.json;
    _dio?.options.headers["accept"] = "application/json";
    _dio?.options.headers["Authorization"] =
        authToken?.isEmpty == true ? '' : 'Bearer $authToken';
    _dio?.options.connectTimeout = (1 * 30 * 1000);  //setting time out
    if (!kReleaseMode) {
      _dio?.interceptors
          .add(LogInterceptor(responseBody: true, requestBody: true));//adding interceptor
    }

    _client = GetDataService(_dio, baseUrl: _baseUrl);
  }

  static RetrofitClientInstance getInstance() {
    return _instance;
  }

  GetDataService getDataService() {
    return _client;
  }
//this is called for setting token
  void reset(String authToken) {
    _instance = RetrofitClientInstance._internal(authToken);
  }
}


