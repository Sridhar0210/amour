import 'package:amour/page2.dart';
import 'package:amour/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Page1.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyB-nFxQVSOPMkEaQ2UmVyjIatn-yLQxf5c",
          appId: "1:990217298863:android:73284e9552c275d66a855a",
          messagingSenderId: "990217298863",
          projectId: "com.AmourGroups.amour",
        )
    );
  }else{
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return const  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:Page1(),
    );
  }
}