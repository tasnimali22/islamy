import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamyapp/Features/presentation/view/hadith/widget/hadith_detelis.dart';
import 'package:islamyapp/Features/presentation/view/hadith/widget/hadithcustom_stack.dart';
import 'package:islamyapp/core/utils/assets.dart';
import 'package:islamyapp/core/utils/constant_colors.dart';

class CustomhadithContainer extends StatelessWidget {
  const CustomhadithContainer({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return HadithDetiles(hadithindex: index);
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(top: 9.h, right: 22.w, left: 22.w),
        width: 313.w,
        height: 618.h,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(DataAssets.hadithBackGround),
          ),
          borderRadius: BorderRadius.circular(23.r),
          color: kPrimiry,
        ),
        child: HadithCustomStack(currentIndex: index),
      ),
    );
  }
}
