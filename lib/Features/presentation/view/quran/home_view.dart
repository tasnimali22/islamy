import 'package:flutter/material.dart';
import 'package:islamyapp/Features/presentation/view/quran/widgets/home_view_body.dart';
import 'package:islamyapp/core/utils/assets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(DataAssets.background),
          fit: BoxFit.cover,
        ),
      ),

      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: HomeViewBody(),
      ),
    );
  }
}
