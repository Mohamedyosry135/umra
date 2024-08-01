import 'package:get/get.dart';

import '../data/forget_password_api_provider.dart';
import '../data/forget_password_repository.dart';
import '../presentation/controller/forget_password_controller.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IForgetPasswordProvider>(ForgetPasswordProvider());
    Get.put<IForgetPasswordRepository>(ForgetPasswordRepository(provider: Get.find()));
    Get.put(ForgetPasswordController(forgetPasswordRepository: Get.find()));
  }
}