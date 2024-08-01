import 'package:get/get.dart';

import '../data/chane_day_api_provider.dart';
import '../data/change_day_repository.dart';
import '../presentation/controllers/change_day_controller.dart';


class ChangeDayBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IChangeDayProvider>(ChangeDayProvider());
    Get.put<IChangeDayRepository>(ChangeDayRepository(provider: Get.find()));
    Get.put(ChangeDayController(changeDayRepository: Get.find()));
  }
}
