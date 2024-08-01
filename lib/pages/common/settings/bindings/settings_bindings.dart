import 'package:get/get.dart';
import 'package:umra/pages/common/settings/data/settings_api_provider.dart';
import 'package:umra/pages/common/settings/data/settings_repository.dart';
import 'package:umra/pages/common/settings/presentation/controllers/settings_controller.dart';


class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ISettingsProvider>(SettingsProvider());
    Get.put<ISettingsRepository>(SettingsRepository(provider: Get.find()));
    Get.put(SettingsController(settingsRepository: Get.find()));
  }
}
