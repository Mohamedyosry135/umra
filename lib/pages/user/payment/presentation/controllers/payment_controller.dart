import 'package:get/get.dart';
import 'package:umra/pages/user/payment/data/payment_repository.dart';

class PaymentController extends SuperController<bool> {
  PaymentController({required this.paymentRepository});

  final IPaymentRepository paymentRepository;

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
