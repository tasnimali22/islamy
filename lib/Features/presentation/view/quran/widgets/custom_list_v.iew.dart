import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamyapp/Features/presentation/view/quran/widgets/item_list_view_horz.dart';
import 'package:islamyapp/Features/presentation/view/quran/widgets/sura_list.dart';

class Customlistview extends StatelessWidget {
  const Customlistview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: ItemListViewHorz(
              enName: englishQuranSurahs[index],
              arName: arabicAuranSuras[index],
              verses: "${ayaNumber[index]} verses",
            ),
          );
        },
      ),
    );
  }
}
