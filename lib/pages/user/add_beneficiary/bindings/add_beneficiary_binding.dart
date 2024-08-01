import 'package:get/get.dart';
import 'package:umra/pages/user/add_beneficiary/data/add_beneficiary_api_provider.dart';
import 'package:umra/pages/user/add_beneficiary/data/add_beneficiary_repository.dart';
import 'package:umra/pages/user/add_beneficiary/presentation/controllers/add_beneficiary_controller.dart';




class AddBeneficiaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAddBeneficiaryApiProvider>(()=>AddBeneficiaryApiProvider());
    Get.lazyPut<IAddBeneficiaryRepository>(()=>AddBeneficiaryRepository(provider: Get.find()));
    Get.lazyPut(()=>AddBeneficiaryController(addBeneficiaryRepository: Get.find()));
  }
}
