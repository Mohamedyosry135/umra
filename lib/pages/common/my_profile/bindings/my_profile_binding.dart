
import 'package:get/get.dart';
import 'package:umra/pages/common/my_profile/data/my_profile_api_provider.dart';
import 'package:umra/pages/common/my_profile/data/my_profile_repository.dart';
import 'package:umra/pages/common/my_profile/presentation/controllers/my_profile_controller.dart';

class MyProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IMyProfileProvider>(MyProfileProvider());
    Get.put<IMyProfileRepository>(MyProfileRepository(provider: Get.find()));
    Get.put(MyProfileController(myProfileRepository: Get.find()));
  }
}