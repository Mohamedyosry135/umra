import 'package:get/get.dart';
import 'package:umra/pages/user/my_beneficiary/data/my_beneficiary_api_provider.dart';
import 'package:umra/pages/user/my_beneficiary/data/my_beneficiary_repository.dart';
import 'package:umra/pages/user/umrah_add_request/data/umrah_add_request_api_provider.dart';
import 'package:umra/pages/user/umrah_add_request/data/umrah_add_request_repository.dart';
import 'package:umra/pages/user/umrah_add_request/presentation/controllers/umrah_add_request_controller.dart';
import 'package:umra/pages/user/urmah_list/data/umrah_list_api_provider.dart';
import 'package:umra/pages/user/urmah_list/data/umrah_list_repository.dart';
import 'package:umra/pages/user/urmah_list/presentation/controllers/umrah_list_controller.dart';
   

class UmrahAddRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IUmrahAddRequestApiProvider>(UmrahAddRequestApiProvider());
    Get.put<IUmrahAddRequestRepository>(UmrahAddRequestRepository(provider: Get.find()));

    Get.put<IMyBeneficiaryApiProvider>(MyBeneficiaryApiProvider());
    Get.put<IMyBeneficiaryRepository>(MyBeneficiaryRepository(provider: Get.find()));

    Get.put(UmrahAddRequestController(umrahAddRequestRepository: Get.find(),myBeneficiaryRepository: Get.find()));
  }
}
