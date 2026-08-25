import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamyapp/core/utils/assets.dart';
import 'package:islamyapp/core/utils/constant_colors.dart';
import 'package:islamyapp/core/utils/styles.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.onChanged,
    this.focusNode,
    required this.controller,
  });
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        labelText: "Sura name",
        labelStyle: Styles.textStyle16.copyWith(color: Colors.white),
        counterStyle: const TextStyle(color: kPrimiry),

        prefixIcon: Padding(
          padding: EdgeInsets.all(15.r),
          child: SvgPicture.asset(DataAssets.icon, height: 28.h, width: 28.w),
        ),
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
      ),
    );
  }

  static var outlineInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: kPrimiry),
    borderRadius: BorderRadius.circular(16.r),
  );
}
