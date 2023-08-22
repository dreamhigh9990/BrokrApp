 import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get/get.dart';
import 'controllers/global_controller.dart';
import 'controllers/ticker_provider.dart';
import 'routes/app_pages.dart';
import 'ui/commons/pages/base_page.dart';
import 'ui/commons/pages/splash_page.dart';
import 'utils/languages_utils.dart';
import 'utils/theme_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<GlobalController>(GlobalController(), permanent: true);
  Get.put<MyTickerProvider>(MyTickerProvider());
  await Settings.init(cacheProvider: SharePreferenceCache());
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        builder: (_, __) {
          return GetMaterialApp(
            builder: (BuildContext context, Widget? child) {
              final mediaQueryData = MediaQuery.of(context);
              final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.0);
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
                child: BasePage(child: child!),
              );
            },
            title: 'brokr',
            debugShowCheckedModeBanner: false,
            initialRoute: SplashPage.name,
            getPages: AppPages.pages,
            translations: Languages(),
            locale: Get.deviceLocale,
            fallbackLocale: const Locale('en', 'US'),
            theme: ThemeData(
              fontFamily: ThemeUtils.interRegular,
              textTheme: TextTheme(
                displayLarge: TextStyle(fontFamily: ThemeUtils.interRegular),
                bodyLarge: TextStyle(fontFamily: ThemeUtils.interRegular),
                bodyMedium: TextStyle(fontFamily: ThemeUtils.interRegular),
                titleMedium: TextStyle(fontFamily: ThemeUtils.interRegular),
                labelSmall: TextStyle(fontFamily: ThemeUtils.interRegular),
                labelLarge: TextStyle(fontFamily: ThemeUtils.interRegular),
                bodySmall: TextStyle(fontFamily: ThemeUtils.interRegular),
              ),
            ),
          );
        });
  }
}
