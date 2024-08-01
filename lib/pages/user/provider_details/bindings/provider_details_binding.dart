import 'package:get/get.dart';
import 'package:umra/pages/user/provider_details/data/provider_details_api_provider.dart';
import 'package:umra/pages/user/provider_details/data/provider_details_repository.dart';
import 'package:umra/pages/user/provider_details/presentation/controllers/provider_details_controller.dart';
import 'package:umra/pages/user/provider_list/data/provider_list_api_provider.dart';
import 'package:umra/pages/user/provider_list/data/provider_list_repository.dart';
import 'package:umra/pages/user/provider_list/presentation/controllers/provider_list_controller.dart';



class ProviderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IProviderDetailsApiProvider>(ProviderDetailsApiProvider());
    Get.put<IProviderDetailsRepository>(ProviderDetailsRepository(provider: Get.find()));
    Get.put(ProviderDetailsController(providerDetailsRepository: Get.find()));
  }
}
