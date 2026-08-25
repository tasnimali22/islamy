import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamyapp/core/utils/constant_colors.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      height: 100.h,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[600]!,
        highlightColor: Colors.grey[800]!,
        child: Container(
          height: 120.h,
          decoration: BoxDecoration(
            color: kBlack,
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
      ),
    );
  }
}
