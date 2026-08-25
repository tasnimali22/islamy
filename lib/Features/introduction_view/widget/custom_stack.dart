import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamyapp/core/utils/assets.dart';

class CustomStack extends StatelessWidget {
  const CustomStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.topCenter,
      children: [
        Image.asset(DataAssets.mosque),
        Positioned(
          right: 50,
          top: 80,
          child: SvgPicture.asset(DataAssets.islami),
        ),
      ],
    );
  }
}
