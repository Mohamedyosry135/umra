import 'package:get/get.dart';
import 'package:umra/pages/user/my_beneficiary/data/my_beneficiary_api_provider.dart';
import 'package:umra/pages/user/my_beneficiary/data/my_beneficiary_repository.dart';
import 'package:umra/pages/user/my_beneficiary/presentation/controllers/my_beneficiary_controller.dart';
import 'package:umra/pages/user/my_requests/data/my_requests_api_provider.dart';
import 'package:umra/pages/user/my_requests/data/my_requests_repository.dart';
import 'package:umra/pages/user/my_requests/presentation/controllers/my_requests_controller.dart';
import 'package:umra/pages/user/rate_provider/data/rate_provider_api_provider.dart';
import 'package:umra/pages/user/rate_provider/presentation/controllers/rate_provider_controller.dart';
import 'package:umra/pages/user/track_order/data/track_order_api_provider.dart';
import 'package:umra/pages/user/track_order/data/track_order_repository.dart';
import 'package:umra/pages/user/track_order/presentation/controllers/track_order_controller.dart';

import '../data/rate_provider_repository.dart';




class RateProivderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IRateProivderApiProvider>(RateProivderApiProvider());
    Get.put<IRateProivderRepository>(RateProivderRepository(provider: Get.find()));
    Get.put(RateProivderController(rateProivderRepository: Get.find()));
  }
}
