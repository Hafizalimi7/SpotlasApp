// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _GetDataService implements GetDataService {
  _GetDataService(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  Future<List<FeedsResponse>> getFeeds(page, limit) async {
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'page_limit': limit
    };
    const _extra = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<FeedsResponse>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, 'interview/feed',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));

    final value = List<FeedsResponse>.from(
        _result.data.map((e) => FeedsResponse.fromJson(e))).toList();
    
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
