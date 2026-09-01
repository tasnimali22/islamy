import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamyapp/Features/presentation/view/Raduio/cubit/cubit_radio/fetch_redios_cubit.dart';
import 'package:islamyapp/Features/presentation/view/Raduio/widget/custom_contain_tapbar.dart';
import 'package:islamyapp/Features/presentation/view/Raduio/widget/custom_loading.dart';

class RaduioScreen extends StatelessWidget {
  const RaduioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchRediosCubit, FetchRediosState>(
      builder: (context, state) {
        if (state is FetchRediosSucess) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 12.w),
            itemCount: state.radiolist.length,
            itemBuilder: (BuildContext context, int index) {
              final String item = state.radiolist[index].url ?? "";
              return Padding(
                padding: EdgeInsets.all(8.r),
                child: CustomContainTapBar(
                  title: state.radiolist[index].name ?? "",
                  isPlaying:
                      context.watch<FetchRediosCubit>().currentIndex == index &&
                      context.watch<FetchRediosCubit>().audio.playing,
                  onpressed: () {
                    context.read<FetchRediosCubit>().play(item, index);
                  },
                ),
              );
            },
          );
        } else if (state is FetchRediosloading) {
          return const CustomLoading();
        } else if (state is FetchRediosFailer)
          // ignore: curly_braces_in_flow_control_structures
          return Center(child: Text(state.errMassage));
        else {
          return const Center(child: Text("حدث خطأ في جلب البيانات"));
        }
      },
    );
  }
}
