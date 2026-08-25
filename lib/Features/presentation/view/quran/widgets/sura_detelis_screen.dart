import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamyapp/Features/presentation/view/Raduio/widget/custom_loading.dart';
import 'package:islamyapp/Features/presentation/view/quran/widgets/read_black.dart';
import 'package:islamyapp/Features/presentation/view/quran/widgets/sura_list.dart';
import 'package:islamyapp/core/utils/loadfile.dart';
import 'package:islamyapp/core/utils/styles.dart';

class SuraDetelisScreen extends StatelessWidget {
  SuraDetelisScreen({super.key, required this.title, required this.suraindex});
  final String title;
  final int suraindex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ReadBlack(titles: title),
        FutureBuilder<List<String>>(
          future: loadQuranText(suraindex),
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
                    int idx = toElement.key;
                    String desc = toElement.value;
                    return "$desc {$idx}";
                  })
                  .join("");
              return Padding(
                padding: EdgeInsets.only(top: 150.h, right: 19.w, left: 19.w),
                child: Container(
                  alignment: Alignment.topCenter,
                  height: 665.h,
                  width: 381.w,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          arabicAuranSuras[suraindex],
                          style: Styles.textStyle24.copyWith(
                            decoration: TextDecoration.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 42.h),
                          child: Text(
                            fullText,
                            style: Styles.textStyle20.copyWith(
                              decoration: TextDecoration.none,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
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

  Future<List<String>> loadQuranText(int index) async {
    List<String> quranAyat = await loadFiles.loadContentText(
      'assets/files/Suras/${index + 1}.txt',
    );
    return quranAyat;
  }
}
