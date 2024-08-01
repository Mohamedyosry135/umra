import 'package:get/get.dart';
import 'package:umra/pages/common/privacy_policy/data/privacy_policy_api_provider.dart';
import 'package:umra/pages/common/privacy_policy/data/privacy_policy_repository.dart';
import 'package:umra/pages/common/privacy_policy/presentation/controllers/privacy_policy_controller.dart';




class PrivacyPolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IPrivacyPolicyProvider>(PrivacyPolicyProvider());
    Get.put<IPrivacyPolicyRepository>(
        PrivacyPolicyRepository(provider: Get.find()));
    Get.put(PrivacyPolicyController(privacyPolicyRepository: Get.find()));
  }
}
