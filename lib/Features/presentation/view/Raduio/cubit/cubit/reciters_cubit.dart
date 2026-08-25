import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamyapp/Features/presentation/data/rectise_model/reciter.dart';
import 'package:islamyapp/Features/presentation/view/Raduio/services/services_reciters.dart';
import 'package:just_audio/just_audio.dart';

part 'reciters_state.dart';

class RecitersCubit extends Cubit<RecitersState> {
  RecitersCubit() : super(RecitersInitial());

  List<Reciter> ractiter = [];
  final AudioPlayer audio = AudioPlayer();
  String? playurl;

  Future<List<Reciter>> getReciter() async {
    emit(RecitersLoading());
    try {
      ractiter = await RecitersAPI().getReciter();
      emit(RecitersSucess(reciterlist: ractiter));
      return ractiter;
    } catch (e) {
      emit(RecitersFailer(errMassage: e.toString()));
      return [];
    }
  }

  Future<void> playReciters(String url) async {
    try {
      if (playurl == url && audio.playing) {
        await audio.stop();
        playurl = null;
        emit(RecitersSucess(reciterlist: ractiter));
        if (audio.playing) {
          await audio.stop();
        }
        playurl = url;
        emit(RecitersSucess(reciterlist: ractiter));
      } else {
        await audio.setUrl(url);
        await audio.play();
        playurl = url;
      }
    } catch (e) {
      return;
    }
    emit(RecitersSucess(reciterlist: ractiter));
  }

  @override
  Future<void> close() {
    audio.dispose();
    return super.close();
  }
}
