import 'package:get/get.dart';
import 'package:umra/pages/common/notification/data/notification_api_provider.dart';
import 'package:umra/pages/common/notification/data/notification_repository.dart';
import 'package:umra/pages/common/notification/presentation/controller/notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<INotificationApiProvider>(NotificationApiProvider());
    Get.put<INotificationRepository>(NotificationRepository(provider: Get.find()));
    Get.put(NotificationController(notificationRepository: Get.find()));
  }
}
