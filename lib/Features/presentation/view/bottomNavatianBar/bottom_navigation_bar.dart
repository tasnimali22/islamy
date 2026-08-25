import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamyapp/Features/presentation/view/Raduio/raduio.dart';
import 'package:islamyapp/Features/presentation/view/bottomNavatianBar/widgetBottomNavation/custom_container.dart';
import 'package:islamyapp/Features/presentation/view/hadith/hadith_view.dart';
import 'package:islamyapp/Features/presentation/view/quran/home_view.dart';
import 'package:islamyapp/Features/presentation/view/sebha/sebha.dart';
import 'package:islamyapp/Features/presentation/view/time/time_view.dart';
import 'package:islamyapp/core/utils/assets.dart';
import 'package:islamyapp/core/utils/constant_colors.dart';

class BottomNavigaterBar extends StatefulWidget {
  const BottomNavigaterBar({super.key});

  @override
  State<BottomNavigaterBar> createState() => _BottomNavigaterBarState();
}

class _BottomNavigaterBarState extends State<BottomNavigaterBar> {
  int currectindex = 0;
  List<Widget> widgets = const [
    HomeView(),
    HadithView(),
    SebhaView(),
    RadioView(),
    TimeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currectindex,
        onTap: (index) {
          setState(() {
            currectindex = index;
          });
        },
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: kPrimiry,

        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(DataAssets.vector),
            label: "Quran",
            activeIcon: const CustomContainer(image: DataAssets.wvector),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(DataAssets.page),
            label: "Hadith",
            activeIcon: const CustomContainer(image: DataAssets.wpage),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(DataAssets.icsebha),
            label: "Sebha",
            activeIcon: const CustomContainer(image: DataAssets.wicsebha),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(DataAssets.icradio),
            label: "Radio",
            activeIcon: const CustomContainer(image: DataAssets.wicradio),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(DataAssets.ictime),
            label: "Time",
            activeIcon: const CustomContainer(image: DataAssets.wictime),
          ),
        ],
      ),
      body: IndexedStack(index: currectindex, children: widgets),
    );
  }
}
