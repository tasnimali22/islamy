import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamyapp/Features/presentation/data/radio_model/radio.dart';
import 'package:islamyapp/Features/presentation/view/Raduio/services/services_radios.dart';
import 'package:just_audio/just_audio.dart';

part 'fetch_redios_state.dart';

class FetchRediosCubit extends Cubit<FetchRediosState> {
  FetchRediosCubit() : super(FetchRediosInitial());

  List<Radio> radio = [];
  final AudioPlayer audio = AudioPlayer();

  String? playurl;
  int? currentIndex;

  Future<List<Radio>> getRadio() async {
    emit(FetchRediosloading());
    try {
      radio = await RadiosApi().getRadio();
      emit(
        FetchRediosSucess(
          radiolist: List.from(radio),
          isPlaying: playurl != null && audio.playing,
        ),
      );
      return radio;
    } catch (e) {
      emit(FetchRediosFailer(errMassage: e.toString()));
      return [];
    }
  }

  Future<void> play(String url, int index) async {
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
      // Handle error silently
    }
    emit(
      FetchRediosSucess(
        radiolist: List.from(radio),
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
