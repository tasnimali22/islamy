import 'package:islamyapp/Features/presentation/data/time_model/time_model/time_model.dart';
import 'package:islamyapp/core/utils/helper/api.dart';

class PrayTimeServices {
  Future<TimeModel?> getPrayTime() async {
    try {
      var responsedata = await ApiServices().get(
        baseUrl:
            'https://api.aladhan.com/v1/timingsByCity/16-07-2024?city=cairo&country=egypt',
      );
      final data = responsedata["data"];

      TimeModel listPrayTime = TimeModel.fromJson(data);
      return listPrayTime;
    } catch (e) {
      return null;
      // TODOA
    }
  }
}
// import 'package:islamyapp/Features/presentation/data/time_model/time_model/time_model.dart';
// import 'package:islamyapp/core/utils/helper/api.dart';

// class PrayTimeServices {
//   Future<TimeModel?> getPrayTime() async {
//     try {
//       var responsedata = await ApiServices().get(
//         baseUrl:
//             'https://api.aladhan.com/v1/timingsByCity/16-07-2024?city=cairo&country=egypt',
//       );
//       final data = responsedata["data"];

//       TimeModel listPrayTime = TimeModel.fromJson(data);
//       return listPrayTime;
//     } catch (e, stacktrace) {
//       //  إضافة stacktrace
//       print("Error: $e");
//       print(
//         "Stacktrace: $stacktrace",
//       ); //  سيحدد اسم الملف والسطر الخاطئ في الـ Terminal
//       return null;
//     }
//   }
// }
