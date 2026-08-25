import 'package:flutter/material.dart';
import 'package:islamyapp/Features/presentation/view/Raduio/widget/custom_default_tab_controller.dart';
import 'package:islamyapp/core/utils/assets.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(DataAssets.backgroundRadio),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        backgroundColor: Colors.transparent.withValues(alpha: 0.5),
        body: const CustomDefaultTabController(),
      ),
    );
  }
}
