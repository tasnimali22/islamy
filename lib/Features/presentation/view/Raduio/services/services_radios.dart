import 'package:islamyapp/Features/presentation/data/radio_model/radio.dart';
import 'package:islamyapp/core/utils/helper/api.dart';

class RadiosApi {
  Future<List<Radio>> getRadio() async {
    try {
      var responsedata = await ApiServices().get(
        baseUrl: 'https://mp3quran.net/api/v3/radios?language=ar',
      );
      // ignore: non_constant_identifier_names
      List<dynamic> Data = responsedata["radios"];

      // ignore: non_constant_identifier_names
      List<Radio> ListRadio = [];
      for (int i = 0; i < Data.length; i++) {
        ListRadio.add(Radio.fromJson(Data[i]));
      }
      return ListRadio;
    } catch (e) {
      return [];
      // TODOA
    }
  }
}
