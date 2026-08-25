import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamyapp/core/utils/assets.dart';
import 'package:islamyapp/core/utils/constant_colors.dart';
import 'package:islamyapp/core/utils/styles.dart';

class ReadBlack extends StatelessWidget {
  const ReadBlack({super.key, required this.titles});
  final String titles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kPrimiry),
        centerTitle: true,
        title: Text(titles, style: Styles.textStyle20),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 18.h, right: 18.w, left: 18.w),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(image: AssetImage(DataAssets.leftImage)),
                Image(image: AssetImage(DataAssets.rightImage)),
              ],
            ),
          ),

          const Spacer(),
          const Image(
            image: AssetImage(DataAssets.bottomImage),
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}
