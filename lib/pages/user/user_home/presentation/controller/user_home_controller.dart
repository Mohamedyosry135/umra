import 'package:umra/pages/user/user_home/data/user_home_repository.dart';
import 'package:get/get.dart';


class UserHomeController extends SuperController<bool> {
  UserHomeController({required this.homeRepository});
  final IUserHomeRepository homeRepository;



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
