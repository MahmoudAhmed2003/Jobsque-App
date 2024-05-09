import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class SaveImageController  {
  static Future<File> saveImage(String imageUrl, String fileName) async {
    final response = await http.get(Uri.parse(imageUrl));

    if (response.statusCode == 200) {
      // Get the document directory using path_provider.
      final directory = await getApplicationDocumentsDirectory();
      // Create a File instance.
      final file = File('${directory.path}/$fileName');
      // Write the file.
      await file.writeAsBytes(response.bodyBytes);
      return file;
    } else {
      throw Exception('Failed to download image');
    }
  }
}