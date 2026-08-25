import 'package:flutter/material.dart';
import 'package:islamyapp/Features/introduction_view/widget/custom_stack.dart';
import 'package:islamyapp/core/utils/assets.dart';
import 'package:islamyapp/core/utils/styles.dart';

class SebhaWidget extends StatelessWidget {
  const SebhaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomStack(),
        Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ", style: Styles.textStylew36),
        Image.asset(DataAssets.sebha1, fit: BoxFit.cover),
      ],
    );
  }
}
