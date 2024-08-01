import 'package:get/get.dart';
import 'package:umra/pages/user/provider_list/data/provider_list_api_provider.dart';
import 'package:umra/pages/user/provider_list/data/provider_list_repository.dart';
import 'package:umra/pages/user/provider_list/presentation/controllers/provider_list_controller.dart';



class ProviderListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IProviderListApiProvider>(ProviderListApiProvider());
    Get.put<IProviderListRepository>(ProviderListRepository(provider: Get.find()));
    Get.put(ProviderListController(providerListRepository: Get.find()));
  }
}
