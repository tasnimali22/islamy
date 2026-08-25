import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamyapp/Features/presentation/view/time/cubit_time/pary_time_state.dart';
import 'package:islamyapp/Features/presentation/view/time/cubit_time/pary_timecubit.dart';
import 'package:islamyapp/Features/presentation/view/time/widget/customcontainertime.dart';

class ListViewTime extends StatelessWidget {
  const ListViewTime({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ParyTimecubit>().state;

    if (state is ParyTimeSucess) {
      final praytime = (state).praytime.first?.timings;
      final List<Map<String, String>> timeList = [
        {"name": "Fajr", "time": praytime?.fajr ?? '', "period": 'AM'},
        {"name": "Dhuhr", "time": praytime?.dhuhr ?? '', "period": 'PM'},
        {"name": "Asr", "time": praytime?.asr ?? '', "period": 'PM'},
        {"name": "Maghrib", "time": praytime?.maghrib ?? '', "period": 'PM'},
        {"name": "Isha", "time": praytime?.isha ?? '', "period": 'PM'},
      ];

      return SizedBox(
        height: 128.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: timeList.length,
          itemBuilder: (BuildContext context, int index) {
            final time = timeList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomContainerTime(
                name: time["name"] ?? '',
                time: time["time"] ?? '',
                period: time["period"] ?? '',
              ),
            );
          },
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
