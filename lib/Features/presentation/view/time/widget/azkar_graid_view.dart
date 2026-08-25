import 'package:flutter/material.dart';
import 'package:islamyapp/Features/presentation/view/time/widget/azcar.dart';
import 'package:islamyapp/core/utils/assets.dart';
import 'package:islamyapp/core/utils/azkar.dart';

class AzkarGraidView extends StatelessWidget {
  const AzkarGraidView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: DataAssets.azcarList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.71,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        String azkarList = Azkar.azkar.keys.elementAt(index);

        return AzcarView(
          inagelist: DataAssets.azcarList[index],
          categoryName: azkarList,
        );
      },
    );
  }
}
