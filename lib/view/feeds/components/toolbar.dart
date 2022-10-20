import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:spotlas/view/feeds/feedsController.dart';

final feedCtrl = Get.put(FeedsController());

Widget toolbar(String id) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SvgPicture.asset(
        "assets/svg/boomarks.svg",
        height: 24.w,
        width: 24.w,
      ),
      SizedBox(
        width: 58.w,
      ),
      SvgPicture.asset(
        "assets/svg/chat.svg",
        height: 24.w,
        width: 24.w,
      ),
      SizedBox(
        width: 58.w,
      ),
      GestureDetector(
        onTap: () {
          bool isLiked = feedCtrl.liked.contains(id);
          if (isLiked) {
            feedCtrl.liked.remove(id);
            feedCtrl.update();
          } else {
            feedCtrl.liked.add(id);
            feedCtrl.update();
          }
        },
        child: SvgPicture.asset(
            "asset/svg/${feedCtrl.liked.contains(id) ? "Heart" : "Liked"}.svg",
            height: 24.w,
            color:
                feedCtrl.liked.contains(id) ? Colors.redAccent : Colors.black,
            width: 24.w),
      ),
      SizedBox(width: 58.w),
      SvgPicture.asset(
        "assets/svg/send.svg",
        height: 24.w,
        width: 24.w,
      )
    ],
  );
}
