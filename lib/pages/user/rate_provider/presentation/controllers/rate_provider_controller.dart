import 'package:umra/pages/user/my_beneficiary/data/my_beneficiary_repository.dart';
import 'package:umra/pages/user/my_requests/data/my_requests_repository.dart';
import 'package:umra/pages/user/rate_provider/data/rate_provider_repository.dart';
import 'package:umra/pages/user/track_order/data/track_order_repository.dart';
import 'package:umra/pages/user/user_home/data/user_home_repository.dart';
import 'package:get/get.dart';


class RateProivderController extends SuperController<bool> {
  RateProivderController({required this.rateProivderRepository});
  final IRateProivderRepository rateProivderRepository;



  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
