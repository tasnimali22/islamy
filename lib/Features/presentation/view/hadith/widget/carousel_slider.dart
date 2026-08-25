import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamyapp/Features/presentation/view/Raduio/widget/custom_loading.dart';
import 'package:islamyapp/Features/presentation/view/hadith/widget/custom_hadith_container.dart';
import 'package:islamyapp/core/utils/loadfile.dart';

class CarouselSliderView extends StatelessWidget {
  const CarouselSliderView({super.key, this.index = 1});
  final int index;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: LoadFiles().loadhadithText(index),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CustomLoading());
        } else if (asyncSnapshot.hasError) {
          return const Center(child: Text('Error loading data'));
        } else if (!asyncSnapshot.hasData || asyncSnapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        }
        final List<String> hadithList = asyncSnapshot.data!;
        if (hadithList.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        return CarouselSlider.builder(
          options: CarouselOptions(
            height: 618.h,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
          ),

          itemCount: 50,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return CustomhadithContainer(index: index++);
          },
        );
      },
    );
  }
}
