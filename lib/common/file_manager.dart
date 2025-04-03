import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class FileManager {
  static late String filename;

  String file() {
    return filename;
  }

  set nameOfFile(String name) {
    filename = name;
  }

  static Future<bool> checkFileExists() async {
    final path = await _localPath;
    final file = filename;
    return File('$path/$file').exists();
  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    final file = filename;
    return File('$path/$file');
  }

  static Future<File> writeFile(String str) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(str);
  }

  static Future<Object> readFile() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();
      return (contents);
    } catch (e) {
      // If encountering an error, return 1
      return Null;
    }
  }
}
