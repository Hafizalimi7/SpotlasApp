import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlas/models/feeds.dart';
import 'package:spotlas/view/feeds/components/profileWidget.dart';
import 'package:spotlas/view/feeds/feedsController.dart';

final feedCtrl = Get.put(FeedsController());

Widget feedbox(
  List<Media> pics,
  String profileUrl,
  String usrname,
  String fullname,
  String spotName,
  String id,
) {
  return Container(
    width: 375.w,
    height: 468.h,
    child: Stack(
      children: [
        GestureDetector(
          onDoubleTap: () {
            bool isLiked = feedCtrl.liked.contains(id);
            if (isLiked) {
              feedCtrl.liked.remove(id); //this section is for unliking a post
              feedCtrl.update();
            } else {
              feedCtrl.liked.add(id);
              feedCtrl.update();
            }
          },
          child: pics.length > 1 ? 
          Container(
                  height: 468.h,
                  child: PageView.builder(
                      onPageChanged: (page) {
                        // setState((){
                        //   currentindex = page;
                        // });
                      },
                      itemCount: pics.length,
                      itemBuilder: (context, index) {
                        return CachedNetworkImage(
                          imageUrl: pics[index].url,
                          placeholder: (context, url) => placeholder,
                          height: 468.h,
                          width: 375.w,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, _) => Icon(
                            Icons.error,
                            size: 32.w,
                            color: Colors.blue,
                          ),
                        );
                      }),
                )
              : CachedNetworkImage(
                  imageUrl: pics[0].url,
                  placeholder: (context, url) => placeholder,
                  height: 468.h,
                  width: 375.w,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, _) => Icon(
                    Icons.error,
                    size: 32.w,
                    color: Colors.blue,
                  ),
                ),
        ),
        Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  profileWidget(
                      Color(0xffFF0040),
                      profileUrl,
                      usrname,
                      fullname,
                      Icon(
                        Icons.more_horiz,
                        size: 24.w,
                        color: Colors.white,
                      )),
                  profileWidget(
                      Color(0xffFFFFFF),
                      profileUrl,
                      spotName,
                      "Peruvian * Marylebone",
                      GestureDetector(
                          onTap: () {
                            bool isSaved = feedCtrl.saved.contains(id);
                            if (isSaved) {
                              feedCtrl.saved.remove(
                                  id); //this section for unsaving a post
                              feedCtrl.update();
                            } else {
                              feedCtrl.saved
                                  .add(id); //this section is for saving a post
                              feedCtrl.update();
                            }
                          },
                          child: feedCtrl.saved.contains(id)
                              ? Icon(
                                  Icons.star,
                                  size: 24.w,
                                  color: Colors.yellow,
                                )
                              : Icon(
                                  Icons.star_border_sharp,
                                  size: 24.w,
                                  color: Colors.white,
                                ))),
                ])),
      ],
    ),
  );
}
