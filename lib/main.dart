import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srs_fyp_2024/app/app.locator.dart';
import 'package:srs_fyp_2024/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBsydN9os7jt3J61gOpJlGAvKTQD63GMAk",
      authDomain: "uni-mentor-6fa2d.firebaseapp.com",
      projectId: "uni-mentor-6fa2d",
      storageBucket: "uni-mentor-6fa2d.appspot.com",
      messagingSenderId: "674408312912",
      appId: "1:674408312912:web:2ae991e51133c326d6a155",
      measurementId: "G-MW7EBSYVTQ",
    ),
  );
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          navigatorKey: StackedService.navigatorKey,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          theme: ThemeData(
            fontFamily: 'Poppins',
          ),
          // home: StartedApp(),
        );
      },
    );
  }
}
