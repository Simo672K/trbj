import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

class FileHandler {
  final String folder;
  const FileHandler({required this.folder});

  Future<Directory> _getAppDocsFolderPath() async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final folderDir = Directory('${appDocDir.path}/$folder');

    if (!await folderDir.exists()) {
      await folderDir.create(recursive: true);
    }

    return folderDir;
  }

  saveFile(String fileName, Uint8List data) async {
    final fileSaveLocation = await _getAppDocsFolderPath();
    final filePath = '${fileSaveLocation.path}/$fileName';

    final file = File(filePath);
    await file.create(recursive: true);
    await file.writeAsBytes(data);
  }

  readFile(String filePath) {
    final file = File(filePath);
    return file;
  }
}
