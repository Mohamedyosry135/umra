import 'package:firebase_core/firebase_core.dart';
import 'package:umra/config/ConfigReader.dart';
import 'package:umra/consts/storage.dart';
import 'package:umra/consts/themes.dart';
import 'package:umra/flavors/flavor_config.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/services/auth_service.dart';
import 'package:umra/shared/logger/logger_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void mainCommon(MyFlavorConfig myFlavorConfig, List<GetPage> screenPages) async {
  await Firebase.initializeApp();

  GetStorage.init(StorageKeys.userDataBox);
  GetStorage.init(StorageKeys.appLanguage);
  GetStorage.init(StorageKeys.userImageDataBox);

  Get.put(AuthService());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(CommonMain(myFlavorConfig,screenPages));
}

class CommonMain extends StatelessWidget {
  final MyFlavorConfig myFlavorConfig;
  final List<GetPage> screenPages;
  CommonMain(this.myFlavorConfig,this.screenPages, {super.key}){
    screenPages.addAll(AppPages.routes);
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return GetMaterialApp.router(
          debugShowCheckedModeBanner: false,
          enableLog: true,
          logWriterCallback: Logger.write,
          theme: Themes.light,
          themeMode: ThemeMode.light,
          getPages: screenPages,

          locale: Locale(AuthService.to.language != null
              ? AuthService.to.language.toString()
              : 'en'),
          fallbackLocale: myFlavorConfig.fallbackLocale,
          supportedLocales: const [Locale('ar', ''), Locale('en', '')],
          translations: myFlavorConfig.myLanguages,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}
