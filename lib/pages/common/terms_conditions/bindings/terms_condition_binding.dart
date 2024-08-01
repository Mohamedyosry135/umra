import 'package:get/get.dart';
import 'package:umra/pages/common/terms_conditions/data/terms_condition_api_provider.dart';
import 'package:umra/pages/common/terms_conditions/data/terms_condition_repository.dart';
import 'package:umra/pages/common/terms_conditions/presentation/controllers/terms_condition_controller.dart';


class TermsConditionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ITermsConditionProvider>(TermsConditionProvider());
    Get.put<ITermsConditionRepository>(TermsConditionRepository(provider: Get.find()));
    Get.put(TermsConditionController(termsConditionRepository: Get.find()));
  }
}
