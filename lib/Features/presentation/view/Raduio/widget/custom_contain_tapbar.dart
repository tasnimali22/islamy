import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamyapp/Features/presentation/view/Raduio/widget/Custom_sound_wave.dart';
import 'package:islamyapp/core/utils/constant_colors.dart';

class CustomContainTapBar extends StatelessWidget {
  const CustomContainTapBar({
    super.key,
    required this.title,
    required this.isPlaying,
    required this.onpressed,
  });
  final String title;
  final bool isPlaying;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 390.w,
      decoration: BoxDecoration(
        color: kPrimiry,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 12.h),
        child: CustomSoundWave(
          title: title,
          isPlaying: isPlaying,
          onpressed: onpressed,
        ),
      ),
    );
  }
}
