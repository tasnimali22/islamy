import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamyapp/Features/presentation/view/Raduio/widget/custom_loading.dart';
import 'package:islamyapp/Features/presentation/view/quran/widgets/read_black.dart';
import 'package:islamyapp/core/utils/loadfile.dart';
import 'package:islamyapp/core/utils/styles.dart';

class HadithDetiles extends StatelessWidget {
  HadithDetiles({super.key, required this.hadithindex});
  final int hadithindex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ReadBlack(titles: "Hadith"),
        FutureBuilder<List<String>>(
          future: loadFiles.loadhadithText(hadithindex),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CustomLoading());
            }
            if (snapshot.hasError) {
              return const Center(child: Text("opps, there was an error"));
            }
            if (snapshot.hasData) {
              List<String> desc = snapshot.data!;
              String fullText = desc
                  .asMap()
                  .entries
                  .map((toElement) {
                    String desc = toElement.value;
                    return desc;
                  })
                  .join("\n");
              return Padding(
                padding: EdgeInsets.only(top: 140.h, right: 19.w, left: 19.w),
                child: Container(
                  alignment: Alignment.topCenter,
                  height: 665.h,
                  width: 381.w,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(top: 42.h),
                      child: Text(
                        fullText,
                        style: Styles.textStyle20.copyWith(
                          decoration: TextDecoration.none,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  final LoadFiles loadFiles = LoadFiles();
}
