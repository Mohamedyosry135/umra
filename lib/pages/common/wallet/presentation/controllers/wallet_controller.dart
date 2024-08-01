import 'package:get/get.dart';

import '../../data/wallet_repository.dart';

class WalletController extends SuperController<dynamic> {
  WalletController({required this.walletRepository});

  final IWalletRepository walletRepository;

  @override
  void onDetached() {

  }

  @override
  void onInactive() {

  }

  @override
  void onPaused() {

  }

  @override
  void onResumed() {

  }
}