

import 'package:umra/base/base_repositroy.dart';

import 'wallet_api_provider.dart';




abstract class IWalletRepository {


}

class WalletRepository extends BaseRepository implements IWalletRepository {
  WalletRepository({required this.provider});
  final IWalletProvider provider;

}
