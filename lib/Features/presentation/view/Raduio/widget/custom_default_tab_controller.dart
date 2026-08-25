import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamyapp/Features/introduction_view/widget/custom_stack.dart';
import 'package:islamyapp/Features/presentation/view/Raduio/widget/custom_card_tapbar.dart';
import 'package:islamyapp/Features/presentation/view/Raduio/widget/raduio_screen.dart';
import 'package:islamyapp/Features/presentation/view/Raduio/widget/reciters_screen.dart';

class CustomDefaultTabController extends StatelessWidget {
  const CustomDefaultTabController({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: const Column(
          children: [
            CustomStack(),
            CustomCardTapBar(),
            Expanded(
              child: TabBarView(children: [RaduioScreen(), RecitersScreen()]),
            ),
          ],
        ),
      ),
    );
  }
}
