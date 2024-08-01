import 'package:get/get.dart';
import 'package:umra/pages/user/urmah_list/data/umrah_list_api_provider.dart';
import 'package:umra/pages/user/urmah_list/data/umrah_list_repository.dart';
import 'package:umra/pages/user/urmah_list/presentation/controllers/umrah_list_controller.dart';
   

class UmrahListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IUmrahListApiProvider>(UmrahListApiProvider());
    Get.put<IUmrahListRepository>(UmrahListRepository(provider: Get.find()));
    Get.put(UmrahListController(umrahListRepository: Get.find()));
  }
}
