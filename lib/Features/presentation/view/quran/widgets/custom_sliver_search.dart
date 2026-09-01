import 'package:flutter/material.dart';
import 'package:islamyapp/Features/presentation/view/quran/widgets/custom_sures_list.dart';
import 'package:islamyapp/Features/presentation/view/quran/widgets/sura_list.dart';

class CustomSliverSearch extends StatelessWidget {
  const CustomSliverSearch({super.key, required this.searchQuery});
  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    print('Arabic count: ${arabicAuranSuras.length}, Query: "$searchQuery"');

    return SliverList.separated(
      itemCount: arabicAuranSuras.length,
      itemBuilder: (BuildContext context, int index) {
        final matchesArabic = arabicAuranSuras[index].contains(searchQuery);
        final matchesEnglish = englishQuranSurahs[index].toLowerCase().contains(
          searchQuery.toLowerCase(),
        );

        if (searchQuery.isNotEmpty && !matchesArabic && !matchesEnglish) {
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
