import 'package:flutter/services.dart';

class LoadFiles {
  Future<List<String>> loadContentText(String path) async {
    String contentText = await rootBundle.loadString(path);
    return contentText.trim().split('\n');

    // setState(() {}); // Update the UI after loading the text
  }

  Future<List<String>> loadhadithText(int index) async {
    List<String> hadith = await loadContentText(
      'assets/files/Hadeeth/h${index + 1}.txt',
    );
    return hadith;
  }
}
