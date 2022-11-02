import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveHelpers {
  static Future<dynamic> initSystemHive() async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    String path = appDocDirectory.path;
    await Hive.initFlutter(path);
    Hive.init(path);
    // Open Hive boxes
    await Hive.openBox(HiveBoxTablesNames.globalBoxApp);
  }

  ///
  /// Clear Data Base
  ///
  static Future clearHive() async {
    await clearBox(HiveBoxTablesNames.globalBoxApp);
  }
}

//
/// Tables Names
//
class HiveBoxTablesNames {
  static const String globalBoxApp = 'globalBoxApp';
}

//
/// Keys Names
//
class HiveKeysNames {
  static const String them = 'appThem';
  static const String lang = 'lang';
}

//
/// Clear Special Box
//
Future<void> clearBox(String boxName) async {
  await Hive.box(boxName).clear();
  debugPrint(" Clear Data Base Table ::  $boxName ::: ");
}
