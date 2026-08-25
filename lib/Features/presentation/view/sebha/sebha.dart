import 'package:flutter/material.dart';
import 'package:islamyapp/Features/presentation/view/sebha/sbha_widget.dart';
import 'package:islamyapp/core/utils/assets.dart';

class SebhaView extends StatelessWidget {
  const SebhaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(DataAssets.sebha),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        backgroundColor: Colors.transparent.withValues(alpha: 0.5),
        body: const SebhaWidget(),
      ),
    );
  }
}
