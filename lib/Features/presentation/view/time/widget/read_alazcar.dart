import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamyapp/Features/presentation/data/azkar_model/azkar_model.dart';
import 'package:islamyapp/Features/presentation/view/quran/widgets/read_black.dart';
import 'package:islamyapp/core/utils/azkar.dart';
import 'package:islamyapp/core/utils/constant_colors.dart';
import 'package:islamyapp/core/utils/styles.dart';

class ReadAlazcar extends StatelessWidget {
  const ReadAlazcar({super.key, required this.category});
  final String? category;

  @override
  Widget build(BuildContext context) {
    List<AzkarModel> currentAzkarList = [];
    final rawData = Azkar.azkar[category];

    if (rawData is List) {
      for (var item in rawData) {
        if (item is List) {
          currentAzkarList.addAll(
            item.map((e) => AzkarModel.fromJson(Map<String, dynamic>.from(e))),
          );
        } else if (item is Map) {
          currentAzkarList.add(
            AzkarModel.fromJson(Map<String, dynamic>.from(item)),
          );
        }
      }
    }

    currentAzkarList = currentAzkarList.take(7).toList();
    return Stack(
      children: [
        const ReadBlack(titles: 'azkar'),
        Padding(
          padding: EdgeInsets.only(
            top: 200.r,
            left: 23.r,
            right: 23.r,
            bottom: 114.h,
          ),
          child: ListView.builder(
            itemCount: currentAzkarList.length,
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.all(8.r),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.r),
                      width: double.infinity.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: kPrimiry, width: 0.5),
                      ),
                      child: Text(
                        currentAzkarList[index].content,
                        style: Styles.textStyle16,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
