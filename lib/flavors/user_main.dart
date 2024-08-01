import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:umra/config/ConfigReader.dart';
import 'package:umra/consts/storage.dart';
import 'package:umra/flavors/flavor_config.dart';
import 'package:umra/flavors/main.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/routes/user_routing/user_app_pages.dart';
import 'package:umra/services/auth_service.dart';

class UserMain{
  UserMain(){
    var flavor = MyFlavorConfig(
      appNameEnum: AppNameEnum.user,
      baseUrl: "https://hubadal.com/api/",
      myLanguages: UserLanguages(),
      myTheme: ThemeData(),
      fallbackLocale: Locale(AuthService.to.language ??"en"),
    );
    Get.put(flavor, permanent: true);
    mainCommon(
      flavor,
      UserAppPages.routes
    );
  }
}

void main()async{
  await GetStorage.init(StorageKeys.userDataBox);
  await GetStorage.init(StorageKeys.appLanguage);
  await GetStorage.init(StorageKeys.userImageDataBox);

  Get.put(AuthService());
  UserMain();
}