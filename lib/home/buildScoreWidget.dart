import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Column buildScoreColumn(String player, int score) {
  return Column(
    children: [
      Text(
        player,
        style: TextStyle(color: Colors.white, fontSize: 18.sp),
      ),
      SizedBox(height: 10.h),
      Text(
        "$score",
        style: TextStyle(color: Colors.white, fontSize: 30.sp),
      ),
    ],
  );
}