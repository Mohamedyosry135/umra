import 'package:get/get.dart';
import 'package:umra/pages/common/support_chat/data/support_chat_api_provider.dart';
import 'package:umra/pages/common/support_chat/data/support_chat_repository.dart';
import 'package:umra/pages/common/support_chat/presentation/controllers/support_chat_controller.dart';


class SupportChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ISupportChatProvider>(SupportChatProvider());
    Get.put<ISupportChatRepository>(SupportChatRepository(provider: Get.find()));
    Get.put(SupportChatController(supportChatRepository: Get.find()));
  }
}
