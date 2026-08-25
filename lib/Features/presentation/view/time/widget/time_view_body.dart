import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamyapp/Features/introduction_view/widget/custom_stack.dart';
import 'package:islamyapp/Features/presentation/view/time/widget/azkar_graid_view.dart';
import 'package:islamyapp/Features/presentation/view/time/widget/container_group.dart';
import 'package:islamyapp/core/utils/assets.dart';
import 'package:islamyapp/core/utils/styles.dart';

class TimeViewBody extends StatelessWidget {
  const TimeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(DataAssets.timeImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        backgroundColor: Colors.transparent.withValues(alpha: 0.7),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomStack(),
                    const ContainerGroup(),
                    SizedBox(height: 15.h),
                    Text(
                      "Azkar",
                      style: Styles.textStylew16,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
            const SliverFillRemaining(child: AzkarGraidView()),
          ],
        ),
      ),
    );
  }
}
