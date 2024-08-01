import 'package:get/get.dart';
import 'package:umra/pages/common/apply_agent/data/apply_agent_api_provider.dart';
import 'package:umra/pages/common/apply_agent/data/apply_agent_repository.dart';
import 'package:umra/pages/common/apply_agent/presentation/controllers/apply_agent_controller.dart';
import 'package:umra/pages/common/signup/data/signup_api_provider.dart';
import 'package:umra/pages/common/signup/data/signup_repository.dart';


class ApplyAgentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IApplyAgentProvider>(ApplyAgentProvider());
    Get.put<IapplyagentRepository>(applyagentRepository(provider: Get.find()));
// to use the upload photo API Request
    Get.put<IsignupProvider>(signupProvider());
    Get.put<IsignupRepository>(signupRepository(provider: Get.find()));
    
    Get.put(ApplyAgentController(applyagentRepository: Get.find(), signupRepository: Get.find()));
  }
}
