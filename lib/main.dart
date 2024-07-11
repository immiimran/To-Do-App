import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:toto_crud/routes/routes_names.dart';
import 'package:toto_crud/routes/routes_pages.dart';
import 'package:toto_crud/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: Appcolors.backgroundColor),
      getPages: RoutesPages.routes,
      initialRoute: RoutesNames.home,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
