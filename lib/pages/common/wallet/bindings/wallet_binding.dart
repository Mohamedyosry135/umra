import 'package:get/get.dart';
import '../data/wallet_api_provider.dart';
import '../data/wallet_repository.dart';
import '../presentation/controllers/wallet_controller.dart';

class WalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IWalletProvider>(WalletProvider());
    Get.put<IWalletRepository>(WalletRepository(provider: Get.find()));
    Get.put(WalletController(walletRepository: Get.find()));
  }
}
