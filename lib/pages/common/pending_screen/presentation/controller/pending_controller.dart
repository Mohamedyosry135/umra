import 'package:get/get.dart';

class PendingController extends SuperController<bool>{


  @override
  void onInit() {
    // TODO: implement onInit
    change(true, status: RxStatus.success());
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