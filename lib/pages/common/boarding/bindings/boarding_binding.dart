import 'package:get/get.dart';
import '../data/boarding_api_provider.dart';

import '../data/boarding_repository.dart';
import '../presentation/controllers/boarding_controller.dart';

class BoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IBoardingProvider>(BoardingProvider());
    Get.put<IBoardingRepository>(BoardingRepository(provider: Get.find()));
    Get.put(BoardingController(boardingRepository: Get.find()));
  }
}
