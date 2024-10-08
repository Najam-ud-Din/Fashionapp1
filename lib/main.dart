import 'package:fashion_app/common/utils/app_routes.dart';
import 'package:fashion_app/src/Auth/controllers/PasswordNotifier.dart';
import 'package:fashion_app/src/Categories/Controllers/cateory_modifier.dart';
import 'package:fashion_app/src/Entrypoint/controller/bottombarindex.dart';
import 'package:fashion_app/src/Products/Controllers/colorsizesnotifier.dart';
import 'package:fashion_app/src/Products/Controllers/productnotifier.dart';
import 'package:fashion_app/src/home/controllers/home_tab_notifier.dart';
import 'package:fashion_app/src/onboarding/controllers/onboarding_notofier.dart';
import 'package:fashion_app/src/splashscreen/view/splashscreenpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //laoad the correct environment
  //await dotenv.load(fileName: Environment.fileName);
  await GetStorage.init();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => OnBoardingNotifier()),
    ChangeNotifierProvider(create: (_) => tabindexnotifier()),
    ChangeNotifierProvider(create: (_) => CateoryNotifier()),
    ChangeNotifierProvider(create: (_) => hometabnotofier()),
    ChangeNotifierProvider(create: (_) => productnotofier()),
    ChangeNotifierProvider(create: (_) => colorsizesnotifier()),
    ChangeNotifierProvider(create: (_) => PasswordNotifier()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: false,
        useInheritedMediaQuery: true,
        child: const SplashScreen(),
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: router,
            scrollBehavior:
                ScrollConfiguration.of(context).copyWith(dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            }),
            debugShowCheckedModeBanner: false,
            title: 'Fashion App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
          );
        });
  }
}
