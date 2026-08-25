import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamyapp/core/utils/constant_colors.dart';

class CustomContainer extends StatelessWidget {
  final String image;
  const CustomContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    // final double sHeight = MediaQuery.of(context).size.height;
    // final double sWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 34.h,
      width: 59.w,
      decoration: BoxDecoration(
        color: kwhite55.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(23),
      ),
      child: SvgPicture.asset(image),
    );
  }
}
