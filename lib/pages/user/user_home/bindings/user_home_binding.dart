import 'package:get/get.dart';
import 'package:umra/pages/user/user_home/data/user_home_api_provider.dart';
import 'package:umra/pages/user/user_home/data/user_home_repository.dart';
import 'package:umra/pages/user/user_home/presentation/controller/user_home_controller.dart';



class UserHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IUserHomeApiProvider>(UserHomeApiProvider());
    Get.put<IUserHomeRepository>(UserHomeRepository(provider: Get.find()));
    Get.put(UserHomeController(homeRepository: Get.find()));
  }
}
