import 'package:get/get.dart';
import 'package:umra/pages/common/verification_code/data/verfication_code_api_provider.dart';
import 'package:umra/pages/common/verification_code/data/verfication_code_repository.dart';
import 'package:umra/pages/common/verification_code/presentation/controllers/verfication_code_controller.dart';


class VerificationCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IVerificationCodeProvider>(VerificationCodeProvider());
    Get.put<IVerificationCodeRepository>(VerificationCodeRepository(provider: Get.find()));
    Get.put(VerificationCodeController(verificationCodeRepository: Get.find()));
  }
}
