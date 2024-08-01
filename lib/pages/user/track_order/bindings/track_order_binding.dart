import 'package:get/get.dart';
import 'package:umra/pages/user/my_beneficiary/data/my_beneficiary_api_provider.dart';
import 'package:umra/pages/user/my_beneficiary/data/my_beneficiary_repository.dart';
import 'package:umra/pages/user/my_beneficiary/presentation/controllers/my_beneficiary_controller.dart';
import 'package:umra/pages/user/my_requests/data/my_requests_api_provider.dart';
import 'package:umra/pages/user/my_requests/data/my_requests_repository.dart';
import 'package:umra/pages/user/my_requests/presentation/controllers/my_requests_controller.dart';
import 'package:umra/pages/user/track_order/data/track_order_api_provider.dart';
import 'package:umra/pages/user/track_order/data/track_order_repository.dart';
import 'package:umra/pages/user/track_order/presentation/controllers/track_order_controller.dart';




class TrackOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ITrackOrderApiProvider>(TrackOrderApiProvider());
    Get.put<ITrackOrderRepository>(TrackOrderRepository(provider: Get.find()));
    Get.put(TrackOrderController(trackOrderRepository: Get.find()));
  }
}
