import 'package:get/get.dart';
import 'package:umra/pages/provider/track_order/data/provider_track_order_api_provider.dart';
import 'package:umra/pages/provider/track_order/data/provider_track_order_repository.dart';
import 'package:umra/pages/provider/track_order/presentation/controllers/provider_track_order_controller.dart';





class ProviderTrackOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IProviderTrackOrderApiProvider>(ProviderTrackOrderApiProvider());
    Get.put<IProviderTrackOrderRepository>(ProviderTrackOrderRepository(provider: Get.find()));
    Get.put(ProviderTrackOrderController(providerTrackOrderRepository: Get.find()));
  }
}
