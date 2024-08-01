import 'package:get/get.dart';
import 'package:umra/pages/user/payment/data/payment_api_provider.dart';
import 'package:umra/pages/user/payment/data/payment_repository.dart';
import 'package:umra/pages/user/payment/presentation/controllers/payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IPaymentApiProvider>(PaymentApiProvider());
    Get.put<IPaymentRepository>(PaymentRepository(provider: Get.find()));
    Get.put(PaymentController(paymentRepository: Get.find()));
  }
}
