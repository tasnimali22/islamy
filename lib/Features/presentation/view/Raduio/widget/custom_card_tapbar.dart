import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamyapp/core/utils/constant_colors.dart';

class CustomCardTapBar extends StatelessWidget {
  const CustomCardTapBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: kwhite55,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: kPrimiry,
          borderRadius: BorderRadius.circular(12),
        ),
        dividerColor: Colors.transparent,
        labelColor: kBlack,

        tabs: const [Text("Radio"), Text("Reciters")],
      ),
    );
  }
}
