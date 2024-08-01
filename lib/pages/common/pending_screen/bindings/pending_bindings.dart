import 'package:get/get.dart';
import 'package:umra/pages/common/pending_screen/presentation/controller/pending_controller.dart';

class PendingBining extends Bindings{
  @override
  void dependencies() {
    Get.put(PendingController());

  }



}