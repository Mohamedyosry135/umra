import 'package:get/get.dart';
import 'package:umra/flavors/flavor_config.dart';
import 'package:umra/pages/common/settings/data/settings_repository.dart';



class SettingsController extends SuperController<dynamic> {
  SettingsController({required this.settingsRepository});

  final ISettingsRepository settingsRepository;
  late AppNameEnum appType;

  @override
  void onInit() {
    if(Get.find<MyFlavorConfig>().appNameEnum == AppNameEnum.user){
      appType = AppNameEnum.user;
    }else{
      appType = AppNameEnum.provider;
    }
    super.onInit();
  }

  @override
  void onDetached() {

  }

  @override
  void onInactive() {

  }

  @override
  void onPaused() {

  }

  @override
  void onResumed() {

  }
}