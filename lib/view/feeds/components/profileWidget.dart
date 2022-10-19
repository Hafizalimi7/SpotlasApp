import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget profileWidget(
    Color color, String picUrl, String username, String fullname, Widget icon) {
  return Row(
    children: [
      circularBox(color, picUrl),
      SizedBox(width: 12.w),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            username,
            style: TextStyle(
                fontSize: 18.sp,
                color: const Color(0xffFFFFFF),
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            fullname,
            style: TextStyle(
                fontSize: 15.sp,
                color: const Color(0xffFFFFFF).withOpacity(0.8),
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
      Expanded(child: SizedBox()),
      icon
    ],
  );
}

Widget circularBox(Color color, String picUrl) {
  return Container(
    padding: EdgeInsets.all(3.w),
    width: 56.w,
    height: 56.w,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    ),
    child: ClipOval(
      child: CachedNetworkImage(
        imageUrl: picUrl,
        placeholder: (context, url) => placeholder,
        height: 32.w,
        width: 32.w,
        fit: BoxFit.cover,
        errorWidget: (context, url, _) =>
            Icon(Icons.person, size: 32.w, color: Colors.blue),
      ),
    ),
  );
}

Widget placeholder =
    Image.asset("assets/images/loading.gif", fit: BoxFit.cover);
