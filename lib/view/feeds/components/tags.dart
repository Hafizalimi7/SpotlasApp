import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget tags(String text) {
  return Card(
    child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
        child: Text(text,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ))),
  );
}
