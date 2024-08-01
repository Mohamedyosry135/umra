import 'package:get/get.dart';
import 'package:umra/pages/user/payment/data/payment_api_provider.dart';
import 'package:umra/pages/user/payment/data/payment_repository.dart';
import 'package:umra/pages/user/payment/presentation/controllers/payment_controller.dart';
import 'package:umra/pages/user/payment_methods/data/payment_methods_repository.dart';
import 'package:umra/pages/user/payment_methods/presentation/controllers/add_credit_card_controller.dart';
import 'package:umra/pages/user/payment_methods/presentation/controllers/bank_account_controller.dart';
import 'package:umra/pages/user/payment_methods/presentation/controllers/payment_methods_controller.dart';

import '../data/payment_methods_api_provider.dart';

class PaymentMethodsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IPaymentMethodsApiProvider>(PaymentMethodsApiProvider());
    Get.put<IPaymentMethodsRepository>(PaymentMethodsRepository(provider: Get.find()));
    Get.put(PaymentMethodsController(paymentMethodsRepository: Get.find()));
    Get.put(BankAccountController(paymentMethodsRepository: Get.find()));
    Get.put(AddCreditCardController(paymentMethodsRepository: Get.find()));


  }
}
