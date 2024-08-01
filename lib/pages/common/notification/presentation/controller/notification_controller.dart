import 'package:umra/pages/common/notification/data/notification_repository.dart';
import 'package:umra/pages/user/user_home/data/user_home_repository.dart';
import 'package:get/get.dart';


class NotificationController extends SuperController<bool> {
  NotificationController({required this.notificationRepository});
  final INotificationRepository notificationRepository;



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
