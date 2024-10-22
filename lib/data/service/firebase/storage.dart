import 'dart:developer';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

enum StorageBuckets { none, logos, images }

class FireStoreService {
  static Future<(String?, Exception?)> uploadFile({
    required Developer developer,
    Project? project,
    required Uint8List bytes,
    String? fileName,
    StorageBuckets bucket = StorageBuckets.none,
  }) async {
    fileName = fileName ?? DateTime.now().millisecondsSinceEpoch.toString();
    String destination = 'portfolio/users/${developer.name}/${project == null ? "" : "${project.id}/"}';

    switch (bucket) {
      case StorageBuckets.logos:
        destination += 'logos/$fileName';
        break;
      case StorageBuckets.images:
        destination += 'images/$fileName';
        break;
      default:
        destination += 'default/$fileName';
        break;
    }
    try {
      final ref = FirebaseStorage.instanceFor(bucket: 'gs://quasar-general.appspot.com').ref(destination);
      TaskSnapshot task = await ref.putData(bytes);
      if (task.state == TaskState.success) {
        final url = await ref.getDownloadURL();
        return (url, null);
      }
    } on Exception catch (e) {
      log(">>>>>>>>>$e");
      return (null, e);
    }
    return (null, null);
  }

  static Future<(bool, Exception?)> deleteFile(String url) async {
    try {
      final ref = FirebaseStorage.instance.refFromURL(url);
      await ref.delete();
      return (true, null);
    } on Exception catch (e) {
      log(">>>>>>>>>$e");
      return (false, e);
    }
  }
}
