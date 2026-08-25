import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamyapp/core/utils/assets.dart';
import 'package:islamyapp/core/utils/constant_colors.dart';
import 'package:islamyapp/core/utils/styles.dart';

class ItemListViewHorz extends StatelessWidget {
  const ItemListViewHorz({
    super.key,
    required this.enName,
    required this.arName,
    required this.verses,
  });
  final String enName;
  final String arName;
  final String verses;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      padding: EdgeInsets.only(top: 12.h, left: 17.w, bottom: 20.h),
      decoration: BoxDecoration(
        color: kPrimiry,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(enName, style: Styles.textStyle24b),
              Text(arName, style: Styles.textStyle24b),
              Text(verses, style: Styles.textStyle14),
            ],
          ),
          Image.asset(DataAssets.listhome, fit: BoxFit.contain),
        ],
      ),
    );
  }
}
