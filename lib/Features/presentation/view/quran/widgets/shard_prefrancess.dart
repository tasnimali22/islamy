// import 'package:shared_preferences/shared_preferences.dart';

// class RecentServicse {
//   static const String _key = "recent";

//   Future<List<int>> recent([int? index]) async {
//     // Obtain shared preferences.
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> recentList = prefs.getStringList(_key) ?? [];
//     String suraIndex = index.toString();

//     recentList.remove(suraIndex);
//     recentList.insert(0, suraIndex);
//     if (recentList.length > 5) {
//       recentList = recentList.sublist(0, 5);
//     }
//     await prefs.setStringList(_key, recentList);
//     return recentList.map((toElement) => int.parse(toElement)).toList();
//   }
// }
