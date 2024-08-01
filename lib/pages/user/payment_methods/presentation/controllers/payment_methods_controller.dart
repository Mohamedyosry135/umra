import 'package:get/get.dart';
import 'package:umra/pages/user/payment/data/payment_repository.dart';
import 'package:umra/pages/user/payment_methods/data/payment_methods_repository.dart';

class PaymentMethodsController extends SuperController<bool> {
  PaymentMethodsController({required this.paymentMethodsRepository});

  final IPaymentMethodsRepository paymentMethodsRepository;
  RxString methodPayment =''.obs;
  List<String>methods = ['Bank Account','Credit Card/Debit Card'];
  RxInt radioButtonSelect = 0.obs;
  changePaymentMethod(val){
    radioButtonSelect.value = val;
  }
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
