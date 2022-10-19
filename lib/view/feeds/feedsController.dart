import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotlas/core/retorfit_client.dart';
import 'package:dio/dio.dart';
import 'package:spotlas/models/feeds.dart';

class FeedsController extends GetxController {
  int page = 0;
  bool hasNextPage = true;
  bool isFirstLoadRunning = false;
  bool isLoadMoreRunning = false;
  List<String> saved = [];
  List<String> liked = [];
  List<FeedsResponse> post = [];
  ScrollController scrollcontroller = new ScrollController();







  void firstLoad() async {

      isFirstLoadRunning = true;
      update();
    try {
      final res = await RetrofitClientInstance.getInstance()
          .getDataService()
          .getFeeds(1, 12);

        post = res;
      update();
    } catch (e) {
      if (e is DioError) {
        if (e.error !=null && e.error is SocketException) {

        }
      }
    }

      isFirstLoadRunning = false;
    update();
  }

  void loadMore() async {
    if (hasNextPage == true &&
        isFirstLoadRunning == false &&
        isLoadMoreRunning == false &&
        scrollcontroller.position.pixels >=
            scrollcontroller.position.maxScrollExtent) {

        isLoadMoreRunning = true;
        update();
      

      page += 1;
      try {
        final res = await RetrofitClientInstance.getInstance()
            .getDataService()
            .getFeeds(1, 12);
        
        final List<FeedsResponse> fetchedPosts = res;
        if (fetchedPosts.length > 0) {
          post.addAll(fetchedPosts);
          update();
        } else {



          hasNextPage = false;
          update();


        }
      } catch (err) {
        print('Something went wrong!');
      }

        isLoadMoreRunning = false;
      update();
    }
  }
}
