import 'package:get/get.dart';

import '../data/provider_home_api_provider.dart';
import '../data/provider_home_repository.dart';
import '../presentation/controller/provider_home_controller.dart';



class ProviderHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IproviderHomeApiProvider>(providerHomeApiProvider());
    Get.put<IproviderHomeRepository>(providerHomeRepository(provider: Get.find()));
    Get.put(ProviderHomeController(providerRepository: Get.find()));
  }
}
