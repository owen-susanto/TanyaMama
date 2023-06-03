import 'dart:async';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_tanya_mama/functions/upload/base_uploader_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class FirebaseUploaderHelper extends BaseUploaderHelper {
  final String? name;
  final String? folder;
  final Future<void> Function(String)? onComplete;
  final Map<String, String> metadata;

  FirebaseUploaderHelper({
    required dynamic filePath,
    this.name,
    this.folder = "images",
    this.onComplete,
    this.metadata = const {},
  }) : super(filePath: filePath);

  Future<void> upload() async {
    var data = await readFile();

    final fileName =
        "${name!.replaceAll(" ", "")}_${DateFormat("yyMMdd_HH:mm:ss").format(DateTime.now())}";

    var contentType = filePath is XFile
        ? filePath.mimeType
        : contentTypeByFilename(filePath!);

    final Reference storageReference =
        FirebaseStorage.instance.ref().child("$folder/$fileName");

    final UploadTask uploadTask = storageReference.putData(
      data,
      SettableMetadata(
        contentType: contentType,
        cacheControl: "max-age=3600",
        customMetadata: metadata,
      ),
    );

    await uploadTask.whenComplete(
      () async => onComplete!(await uploadTask.snapshot.ref.getDownloadURL()),
    );
  }

  String contentTypeByFilename(String filename) {
    final seqs = filename.split('.');
    const defaultType = "application/octet-stream";
    if (seqs.length == 1) return defaultType;
    final ext = seqs[seqs.length - 1];
    return _EXTRA_TYPES_MAP['.$ext'] ?? defaultType;
  }
}

const _EXTRA_TYPES_MAP = {
  ".aac": "audio/aac",
  ".abw": "application/x-abiword",
  ".arc": "application/x-freearc",
  ".avi": "video/x-msvideo",
  ".azw": "application/vnd.amazon.ebook",
  ".bin": "application/octet-stream",
  ".bmp": "image/bmp",
  ".bz": "application/x-bzip",
  ".bz2": "application/x-bzip2",
  ".csh": "application/x-csh",
  ".css": "text/css",
  ".csv": "text/csv",
  ".doc": "application/msword",
  ".docx":
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
  ".eot": "application/vnd.ms-fontobject",
  ".epub": "application/epub+zip",
  ".gif": "image/gif",
  ".htm": "text/html",
  ".html": "text/html",
  ".ico": "image/vnd.microsoft.icon",
  ".ics": "text/calendar",
  ".jar": "application/java-archive",
  ".jpeg": "image/jpeg",
  ".jpg": "image/jpeg",
  ".js": "text/javascript",
  ".json": "application/json",
  ".jsonld": "application/ld+json",
  ".mp3": "audio/mpeg",
  ".mp4": "video/mp4",
  ".mpeg": "video/mpeg",
  ".mpkg": "application/vnd.apple.installer+xml",
  ".odp": "application/vnd.oasis.opendocument.presentation",
  ".ods": "application/vnd.oasis.opendocument.spreadsheet",
  ".odt": "application/vnd.oasis.opendocument.text",
  ".oga": "audio/ogg",
  ".ogv": "video/ogg",
  ".ogx": "application/ogg",
  ".otf": "font/otf",
  ".png": "image/png",
  ".pdf": "application/pdf",
  ".ppt": "application/vnd.ms-powerpoint",
  ".pptx":
      "application/vnd.openxmlformats-officedocument.presentationml.presentation",
  ".rar": "application/x-rar-compressed",
  ".rtf": "application/rtf",
  ".sh": "application/x-sh",
  ".svg": "image/svg+xml",
  ".swf": "application/x-shockwave-flash",
  ".tar": "application/x-tar",
  ".tif": "image/tiff",
  ".tiff": "image/tiff",
  ".ts": "video/mp2t",
  ".ttf": "font/ttf",
  ".txt": "text/plain",
  ".vsd": "application/vnd.visio",
  ".wav": "audio/wav",
  ".weba": "audio/webm",
  ".webm": "video/webm",
  ".webp": "image/webp",
  ".woff": "font/woff",
  ".woff2": "font/woff2",
  ".xhtml": "application/xhtml+xml",
  ".xls": "application/vnd.ms-excel",
  ".xlsx": "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
  ".xul": "application/vnd.mozilla.xul+xml",
  ".zip": "application/zip",
  ".3gp": "video/3gpp",
  ".3g2": "video/3gpp2"
};
