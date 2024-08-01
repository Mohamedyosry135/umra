import 'package:get/get.dart';
import 'package:umra/pages/user/my_beneficiary/data/my_beneficiary_api_provider.dart';
import 'package:umra/pages/user/my_beneficiary/data/my_beneficiary_repository.dart';
import 'package:umra/pages/user/my_beneficiary/presentation/controllers/my_beneficiary_controller.dart';
import 'package:umra/pages/user/my_requests/data/my_requests_api_provider.dart';
import 'package:umra/pages/user/my_requests/data/my_requests_repository.dart';
import 'package:umra/pages/user/my_requests/presentation/controllers/my_requests_controller.dart';




class MyRequestsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IMyRequestsApiProvider>(MyRequestsApiProvider());
    Get.put<IMyRequestsRepository>(MyRequestsRepository(provider: Get.find()));
    Get.put(MyRequestsController(myRequestsRepository: Get.find()));
  }
}
