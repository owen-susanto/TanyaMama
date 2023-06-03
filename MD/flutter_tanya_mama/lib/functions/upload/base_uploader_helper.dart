import 'dart:io';
import 'dart:typed_data';

abstract class BaseUploaderHelper {
  dynamic filePath;

  BaseUploaderHelper({required this.filePath});

  Future<Uint8List> readFile() async {
    if (filePath is String) {
      File file = File(filePath!);
      var value = await file.readAsBytes();
      return Uint8List.fromList(value);
    }

    if (filePath is File) {
      var value = await filePath.readAsBytes();
      return Uint8List.fromList(value);
    }

    return filePath.readAsBytes();
  }
}
