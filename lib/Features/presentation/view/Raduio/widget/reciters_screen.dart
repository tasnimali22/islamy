import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamyapp/Features/presentation/view/Raduio/cubit/cubit/reciters_cubit.dart';
import 'package:islamyapp/Features/presentation/view/Raduio/widget/custom_contain_tapbar.dart';
import 'package:islamyapp/Features/presentation/view/Raduio/widget/custom_loading.dart';

class RecitersScreen extends StatelessWidget {
  const RecitersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecitersCubit, RecitersState>(
      builder: (context, state) {
        if (state is RecitersSucess) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemCount: state.reciterlist.length,
            itemBuilder: (BuildContext context, int index) {
              final String reciteritem =
                  state.reciterlist[index].moshaf?.first.server ?? "";

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomContainTapBar(
                  title: state.reciterlist[index].name ?? " ",
                  isPlaying:
                      context.watch<RecitersCubit>().playurl == reciteritem,
                  onpressed: () {
                    context.read<RecitersCubit>().playReciters(reciteritem);
                  },
                ),
              );
            },
          );
        } else if (state is RecitersLoading) {
          return const CustomLoading();
        } else {
          return const Text("حدث خطأ في جلب البيانات");
        }
      },
    );
  }
}
