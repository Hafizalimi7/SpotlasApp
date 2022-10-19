import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

Widget readmoreText(String text, String usrname) {
  return ReadMoreText(text,
      trimLines: 2,
      preDataText: usrname + " ",
      preDataTextStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
      colorClickableText: Colors.grey,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'more',
      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
      moreStyle: TextStyle(
          fontSize: 15.sp, fontWeight: FontWeight.w400, color: Colors.grey)
  );
}
