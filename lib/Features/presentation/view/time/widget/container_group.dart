import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamyapp/Features/presentation/view/time/cubit_time/pary_time_state.dart';
import 'package:islamyapp/Features/presentation/view/time/cubit_time/pary_timecubit.dart';
import 'package:islamyapp/Features/presentation/view/time/widget/customtimeview.dart';
import 'package:islamyapp/Features/presentation/view/time/widget/list_view_time.dart';
import 'package:islamyapp/core/utils/assets.dart';
import 'package:islamyapp/core/utils/constant_colors.dart';
import 'package:islamyapp/core/utils/styles.dart';

class ContainerGroup extends StatelessWidget {
  const ContainerGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParyTimecubit, ParyTimeState>(
      builder: (BuildContext context, state) {
        return Container(
          height: 301,
          width: double.infinity,

          decoration: BoxDecoration(
            color: kBage,
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
              image: AssetImage(DataAssets.group),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomTimeView(),
              const SizedBox(height: 128, child: ListViewTime()),

              Text(
                "Next Play"
                " ${DateTime.now().hour}:${DateTime.now().minute}",
                style: Styles.textStyle16b,
              ),
            ],
          ),
        );
      },
    );
  }
}
