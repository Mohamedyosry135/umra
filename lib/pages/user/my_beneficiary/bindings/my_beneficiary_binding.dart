import 'package:get/get.dart';
import 'package:umra/pages/user/my_beneficiary/data/my_beneficiary_api_provider.dart';
import 'package:umra/pages/user/my_beneficiary/data/my_beneficiary_repository.dart';
import 'package:umra/pages/user/my_beneficiary/presentation/controllers/my_beneficiary_controller.dart';




class MyBeneficiaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IMyBeneficiaryApiProvider>(MyBeneficiaryApiProvider());
    Get.put<IMyBeneficiaryRepository>(MyBeneficiaryRepository(provider: Get.find()));
    Get.put(MyBeneficiaryController(beneficiaryRepository: Get.find()));
  }
}
