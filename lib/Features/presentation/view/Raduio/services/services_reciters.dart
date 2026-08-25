import 'package:islamyapp/Features/presentation/data/rectise_model/reciter.dart';
import 'package:islamyapp/core/utils/helper/api.dart';

class RecitersAPI {
  Future<List<Reciter>> getReciter() async {
    try {
      var responsedata = await ApiServices().get(
        baseUrl: 'https://www.mp3quran.net/api/v3/reciters?language=ar',
      );
      // ignore: non_constant_identifier_names
      List<dynamic> Data = responsedata["reciters"];

      // ignore: non_constant_identifier_names
      List<Reciter> Listreciter = [];
      for (int i = 0; i < Data.length; i++) {
        Listreciter.add(Reciter.fromJson(Data[i]));
      }
      return Listreciter;
    }  catch (e) {
      return [];
      // TODOA
    }
  }
}
