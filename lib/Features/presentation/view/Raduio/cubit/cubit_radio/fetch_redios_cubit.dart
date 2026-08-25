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

  Future<List<Radio>> getRadio() async {
    emit(FetchRediosloading());
    try {
      radio = await RadiosApi().getRadio();
      emit(FetchRediosSucess(radiolist: radio));
      return radio;
    } catch (e) {
      emit(FetchRediosFailer(errMassage: e.toString()));
      return [];
    }
  }

  Future<void> play(String url) async {
    try {
      if (playurl == url && audio.playing) {
        await audio.pause();
        emit(FetchRediosSucess(radiolist: radio));
        if (audio.playing) {
          await audio.stop();
        }
        playurl = url;
        emit(FetchRediosSucess(radiolist: radio));
      } else {
        if (playurl != url) {
          await audio.setUrl(url);
          await audio.play();
          playurl = url;
        }
      }
    } catch (e) {
      // Handle error silently
    }
    emit(FetchRediosSucess(radiolist: radio));
  }

  @override
  Future<void> close() {
    audio.dispose();
    return super.close();
  }
}
