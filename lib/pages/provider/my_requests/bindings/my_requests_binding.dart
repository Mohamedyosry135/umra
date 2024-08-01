import 'package:get/get.dart';
import 'package:umra/pages/provider/my_days/data/my_days_api_provider.dart';
import 'package:umra/pages/provider/my_days/data/my_days_repository.dart';
import 'package:umra/pages/provider/my_days/presentation/controllers/my_days_controller.dart';
import 'package:umra/pages/provider/my_requests/data/my_requests_api_provider.dart';
import 'package:umra/pages/provider/my_requests/data/my_requests_repository.dart';
import 'package:umra/pages/provider/my_requests/presentation/controllers/my_requests_controller.dart';

class MyRequestsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IMyRequestsApiProvider>(MyRequestsApiProvider());
    Get.put<IMyRequestsRepository>(MyRequestsRepository(provider: Get.find()));
    Get.put(MyOrdersController(myRequestsRepository: Get.find()));
  }
}