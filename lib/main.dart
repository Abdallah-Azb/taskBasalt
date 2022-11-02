import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_basalt/core/local/hive/hive_helpers.dart';
import 'package:task_basalt/core/navigation/navigation.dart';
import 'package:task_basalt/core/navigation/routes.dart';
import 'package:task_basalt/widgets/text/app_text.dart';
import 'core/injection/app_injection.dart' as common;

void main() async {
  // test
  ErrorWidget.builder = (details) {
    return Material(
      color: Colors.lightGreen,
      elevation: 2.0,
      animationDuration: const Duration(seconds: 1),
      borderOnForeground: true,
      borderRadius: BorderRadius.circular(15),
      // type: MaterialType.canvas,
      child: Center(
        child: Text(
          details.exception.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  };
  WidgetsFlutterBinding.ensureInitialized();
  var initialRoute = await Routes.initialRoute;

  await HiveHelpers.initSystemHive();
  common.commonInjections.allowReassignment = true;

  await common.init();

  runApp(MyApp(initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task Basalt',
      initialRoute: initialRoute,
      getPages: Nav.routes,
      //
    );
  }
}


