import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamyapp/Features/introduction_view/widget/custom_stack.dart';
import 'package:islamyapp/Features/presentation/view/hadith/widget/carousel_slider.dart';

class HadithViewBody extends StatelessWidget {
  const HadithViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: const Stack(
        children: [
          Column(children: [CustomStack(), CarouselSliderView()]),
        ],
      ),
    );
  }
}
