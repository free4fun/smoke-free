import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:no_more_smoke/common/file_manager.dart';

class AddSmokedModel extends ChangeNotifier {
  static addSomoked(DateTime datetime, String relevance, String reason,
      String? circumstance) async {
    String jsonSmokedStr =
        "{datetime:${datetime.toString()},relevance:$relevance,reason:$reason,circumstance:${circumstance!}}";
    final Map<String, String> pairs = {};
    for (int i = 0; i < jsonSmokedStr.length; i++) {
      var thisjsonSmokedStrJson = jsonSmokedStr[i].split(":");
      pairs[thisjsonSmokedStrJson[0]] = thisjsonSmokedStrJson[1].trim();
    }
    var encoded = json.encode(pairs);
    FileManager.filename = "smoked.json";
    FileManager.writeFile(encoded);
  }

  static getSmoked() async {
    FileManager.filename = "smoked.json";
    bool fileExists = await FileManager.checkFileExists();
    if (fileExists) {
      var smoked = await FileManager.readFile();
      var smokedStr = jsonDecode(smoked.toString());
      return smokedStr;
    } else {
      return null;
    }
  }

  static getLastSmokedDateTime() async {
    FileManager.filename = "smoked.json";
    bool fileExists = await FileManager.checkFileExists();
    if (fileExists) {
      String smokedDate = await FileManager.readFile() as String;
      List<dynamic> decodedJson = jsonDecode(smokedDate) as List<dynamic>;
      final date = decodedJson.last.datetime as String;
      return date;
    } else {
      return null;
    }
  }
}
