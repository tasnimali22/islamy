import 'package:flutter/material.dart';
import 'package:islamyapp/Features/presentation/view/quran/widgets/custom_sures_list.dart';
import 'package:islamyapp/Features/presentation/view/quran/widgets/sura_list.dart';

class CustomSliverList extends StatelessWidget {
  const CustomSliverList({super.key, required this.searchQuery});
  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: arabicAuranSuras.length,
      itemBuilder: (BuildContext context, int index) {
        if (searchQuery.isNotEmpty &&
            !arabicAuranSuras[index].contains(searchQuery)) {
          return const SizedBox.shrink();
        }
        return CustomSura(
          suraNamber: index,
          entitle: englishQuranSurahs[index],
          artitle: arabicAuranSuras[index],
          lEntitle: englishQuranSurahs[index],
          lArtitle: arabicAuranSuras[index],
          ayanumber: '${ayaNumber[index]} Verses',
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        if (searchQuery.isEmpty) {
          return const Divider(thickness: 1, indent: 16, endIndent: 16);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
