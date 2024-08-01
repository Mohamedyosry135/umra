import 'package:get/get.dart';
import '../../login/data/login_api_provider.dart';
import '../../login/data/login_repository.dart';
import '../data/signup_api_provider.dart';

import '../data/signup_repository.dart';
import '../presentation/controllers/signup_controller.dart';

class signupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IsignupProvider>(signupProvider());
    Get.put<IsignupRepository>(signupRepository(provider: Get.find()));
    Get.put(SignupController(signupRepository: Get.find()));
  }
}
