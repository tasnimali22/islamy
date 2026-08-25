import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamyapp/Features/presentation/view/Raduio/widget/custom_loading.dart';
import 'package:islamyapp/core/utils/assets.dart';
import 'package:islamyapp/core/utils/loadfile.dart';
import 'package:islamyapp/core/utils/styles.dart';

class HadithCustomStack extends StatelessWidget {
  HadithCustomStack({super.key, required this.currentIndex});

  final LoadFiles loadFiles = LoadFiles();
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(image: AssetImage(DataAssets.haditihleft)),
                Image(image: AssetImage(DataAssets.haditihright)),
              ],
            ),
            const Spacer(),
            Image.asset(
              DataAssets.haditihMosque,
              fit: BoxFit.fitWidth,
              width: 312.w,
              alignment: Alignment.bottomCenter,
            ),
          ],
        ),
        Align(
          alignment: Alignment.topCenter,
          child: FutureBuilder(
            future: loadFiles.loadhadithText(currentIndex),
            builder: (BuildContext context, snapshot) {
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

                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 100.h),
                      child: Text(
                        fullText,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        maxLines: 14,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle16b,
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
