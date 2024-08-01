import 'package:get/get.dart';
import 'package:umra/pages/common/next_signup/presentation/controllers/next_signup_controller.dart';
import '../data/next_signup_api_provider.dart';

import '../data/next_signup_repository.dart';

class nextsignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<InextsignupProvider>(nextsignupProvider());
    Get.put<InextsignupRepository>(nextsignupRepository(provider: Get.find()));
    Get.put(NextSignupController(nextsignupRepository: Get.find()));
  }
}
