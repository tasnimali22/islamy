import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islamyapp/Features/introduction_view/widget/custom_images.dart';
import 'package:islamyapp/Features/introduction_view/widget/custom_stack.dart';
import 'package:islamyapp/Features/presentation/view/bottomNavatianBar/bottom_navigation_bar.dart';
import 'package:islamyapp/core/utils/assets.dart';
import 'package:islamyapp/core/utils/constant_colors.dart';
import 'package:islamyapp/core/utils/styles.dart';

class IntroctionView extends StatelessWidget {
  const IntroctionView({super.key});

  @override
  Widget build(BuildContext context) {
    final double sHeight = MediaQuery.of(context).size.height;
    return IntroductionScreen(
      controlsPadding: EdgeInsets.zero,
      controlsMargin: EdgeInsets.zero,
      onDone: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return const BottomNavigaterBar();
            },
          ),
        );
      },
      done: Text("Finish", style: Styles.textStyle16),
      next: Text("next", style: Styles.textStyle16),
      back: Text("back", style: Styles.textStyle16),
      dotsDecorator: DotsDecorator(
        size: Size.square(7.r),
        activeSize: Size(21.w, 7.h),
        activeColor: kPrimiry,
        color: kGray,
      ),
      showBackButton: true,

      pages: [
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: const SizedBox.shrink(),

          decoration: PageDecoration(
            titleTextStyle: Styles.textStyle20,
            imagePadding: EdgeInsets.zero,
            contentMargin: EdgeInsets.zero,
            safeArea: 0,
            fullScreen: true,
          ),
          useScrollView: false,
          image: Padding(
            padding: EdgeInsets.symmetric(vertical: 21.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomStack(),
                SvgPicture.asset(DataAssets.frame, fit: BoxFit.contain),
                SizedBox(height: sHeight * 0.10),

                Text("Welcome To Islami", style: Styles.textStyle20),
              ],
            ),
          ),
        ),
        /////////////////////////////
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: const SizedBox.shrink(),

          decoration: const PageDecoration(
            imagePadding: EdgeInsets.zero,
            contentMargin: EdgeInsets.zero,
            fullScreen: true,
          ),

          image: const CustomImage(
            images: DataAssets.welcome,

            title: "Welcome To Islami",
            description:
                "We Are Very Excited To Have You In Our Community"
                "Welcome To Islami",
          ),
        ),

        ////////////////////////////
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: const SizedBox.shrink(),

          decoration: const PageDecoration(
            imagePadding: EdgeInsets.zero,
            contentMargin: EdgeInsets.zero,
            fullScreen: true,
          ),
          useScrollView: false,
          image: const CustomImage(
            images: DataAssets.readingtheQuran,
            title: "Reading the Quran",
            description: "Read, and your Lord is the Most Generous",
          ),
        ),
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: const SizedBox.shrink(),

          decoration: const PageDecoration(
            imagePadding: EdgeInsets.zero,
            contentMargin: EdgeInsets.zero,
            fullScreen: true,
          ),
          useScrollView: false,
          image: const CustomImage(
            images: DataAssets.bearish,
            title: "Bearish",
            description:
                "Praise the name of your Lord, the Most HighPraise the name of your Lord, the Most High",
          ),
        ),
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: const SizedBox.shrink(),

          decoration: const PageDecoration(
            imagePadding: EdgeInsets.zero,
            contentMargin: EdgeInsets.zero,
            fullScreen: true,
          ),
          useScrollView: false,
          image: const CustomImage(
            images: DataAssets.radio,
            title: "Holy Quran Radio",
            description:
                "You can listen to the Holy Quran Radio through the application for free and easily",
          ),
        ),
      ],
    );
  }
}
