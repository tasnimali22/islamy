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
  int? currentIndex;

  Future<List<Reciter>> getReciter() async {
    emit(RecitersLoading());
    try {
      ractiter = await RecitersAPI().getReciter();
      emit(
        RecitersSucess(
          reciterlist: List.from(ractiter),
          isPlaying: playurl != null && audio.playing,
        ),
      );
      return ractiter;
    } catch (e) {
      emit(RecitersFailer(errMassage: e.toString()));
      return [];
    }
  }

  Future<void> playReciters(String url, int index) async {
    try {
      if (currentIndex == index) {
        if (audio.playing) {
          await audio.pause();
          playurl = null;
          currentIndex = null;
        } else {
          await audio.play();
          playurl = url;
          currentIndex = index;
        }
      } else {
        if (playurl != null && audio.playing) {
          await audio.stop();
        }
        await audio.setUrl(url);
        await audio.play();
        playurl = url;
        currentIndex = index;
      }
    } catch (e) {
      return;
    }
    emit(
      RecitersSucess(
        reciterlist: List.from(ractiter),
        isPlaying: currentIndex == index && audio.playing,
      ),
    );
  }

  @override
  Future<void> close() {
    audio.dispose();
    return super.close();
  }
}
