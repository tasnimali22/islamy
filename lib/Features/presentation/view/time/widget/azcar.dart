import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamyapp/Features/presentation/view/time/widget/read_alazcar.dart';
import 'package:islamyapp/core/utils/constant_colors.dart';
import 'package:islamyapp/core/utils/styles.dart';

class AzcarView extends StatelessWidget {
  const AzcarView({
    super.key,
    required this.inagelist,
    required this.categoryName,
  });
  final String inagelist;

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReadAlazcar(category: categoryName),
          ),
        );
        // Handle tap event
      },
      child: Container(
        padding: EdgeInsets.only(top: 20.h),
        alignment: Alignment.bottomCenter,
        height: 260.h,
        width: 185.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: kPrimiry, width: 1.w),
          color: kBlack,
        ),
        child: Column(
          children: [
            Image.asset(inagelist, fit: BoxFit.contain),
            Text(categoryName, style: Styles.textStylew20),
          ],
        ),
      ),
    );
  }
}
