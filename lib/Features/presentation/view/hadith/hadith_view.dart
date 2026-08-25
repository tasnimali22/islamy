import 'package:flutter/material.dart';
import 'package:islamyapp/Features/presentation/view/hadith/widget/hadith_view_body.dart';
import 'package:islamyapp/core/utils/assets.dart';

class HadithView extends StatelessWidget {
  const HadithView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(DataAssets.haditih),
          fit: BoxFit.cover,
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: HadithViewBody(),
      ),
    );
  }
}
