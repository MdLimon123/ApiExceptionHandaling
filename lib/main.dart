   import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_pattern/res/getx_localization/languages.dart';
import 'package:mvvm_pattern/res/routes/routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      getPages: AppRoutes.appRoutes(),
    );
  }
}


