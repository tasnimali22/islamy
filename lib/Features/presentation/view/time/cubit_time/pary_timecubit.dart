import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamyapp/Features/presentation/data/time_model/time_model/time_model.dart';
import 'package:islamyapp/Features/presentation/view/time/cubit_time/pary_time_state.dart';
import 'package:islamyapp/Features/presentation/view/time/services/pray_time.dart';

class ParyTimecubit extends Cubit<ParyTimeState> {
  ParyTimecubit() : super(ParyTimeInitial()) {
    fetchpraytime();
  }

  Future<TimeModel> fetchpraytime() async {
    emit(ParyTimeLoading());
    try {
      final time = await PrayTimeServices().getPrayTime();
      if (time == null) {
        emit(const ParyTimeFailer(errMassage: "Failed to fetch prayer time."));
        return const TimeModel();
      } else {
        emit(ParyTimeSucess(praytime: [time]));
        return time;
      }
    } catch (e) {
      emit(const ParyTimeFailer(errMassage: "Failed to fetch prayer time."));
      return const TimeModel();
    }
  }
}
