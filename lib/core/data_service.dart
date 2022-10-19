import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:spotlas/models/feeds.dart';

part 'data_service.g.dart';


@RestApi()

abstract class GetDataService {
  factory GetDataService(Dio dio, {String baseUrl}) = _GetDataService;

  @GET("interview/feed")
  Future<List<FeedsResponse>> getFeeds (
    @Query("page") int page, @Query("page_limit") int limit);
}