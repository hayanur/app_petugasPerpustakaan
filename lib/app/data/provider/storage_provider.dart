import 'package:get_storage/get_storage.dart';

//untuk nyimpan data di lokal storage (semacam session)
//base nya get_storage, memudahkan kita klo make berulang

class StorageProvider {
  static write(key, String value) async {
    await GetStorage().write(key, value);
  }


  static String read(key) {
    try {
      return GetStorage().read(key);
    } catch (e) {
      return "";
    }
  }


  static void clearAll() {
    GetStorage().erase();
  }
}


class StorageKey {
  static const String status = "status";
}
