import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlas/models/feeds.dart';
import 'package:spotlas/view/feeds/components/readmore.dart';
import 'package:spotlas/view/feeds/components/tags.dart';
import 'package:spotlas/view/feeds/components/toolbar.dart';
import 'package:jiffy/jiffy.dart';

import 'components/box.dart';

Widget feedsModel(
    List<Media> spotpicUrl,
    String profileUrl,
    String usrname,
    String fullname,
    String description,
    String spotname,
    String date,
    String id) {
  DateTime date1 = DateTime.parse(date);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      feedbox(spotpicUrl, profileUrl, usrname, fullname, spotname, id),
      SizedBox(
        height: 16.h,
      ),
      toolbar(id),
      SizedBox(
        height: 16.h,
      ),
      Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: readmoreText(description, usrname),
      ),
      SizedBox(
        height: 8.h,
      ),
      Container(
        padding: EdgeInsets.only(left: 12.w),
        height: 40.h,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                tags("Outdoors"),
                tags("Cheap"),
                tags("Live Music"),
                tags("Romatic"),
                SizedBox(
                  width: 3.w,
                ),
              ],
            )
          ],
        ),
      ),
      SizedBox(
        height: 12.h,
      ),
      Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: Text(
          "${Jiffy(date1).fromNow()}",
          style: TextStyle(color: Colors.grey),
        ),
      ),
      SizedBox(
        height: 24.h,
      )
    ],
  );
}
