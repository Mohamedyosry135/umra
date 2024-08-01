import 'package:get/get.dart';
import 'package:umra/pages/provider/my_days/data/my_days_api_provider.dart';
import 'package:umra/pages/provider/my_days/data/my_days_repository.dart';
import 'package:umra/pages/provider/my_days/presentation/controllers/my_days_controller.dart';

class MyDaysBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IMyDaysApiProvider>(MyDaysApiProvider());
    Get.put<IMyDaysRepository>(MyDaysRepository(provider: Get.find()));
    Get.put(MyDaysController(myDaysRepository: Get.find()));
  }
}