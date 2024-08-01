import 'package:umra/base/base_repositroy.dart';
import 'package:umra/pages/user/payment/data/payment_api_provider.dart';
import 'package:umra/pages/user/rate_provider/data/rate_provider_api_provider.dart';
import 'package:umra/pages/user/track_order/data/track_order_api_provider.dart';

import 'payment_methods_api_provider.dart';

abstract class IPaymentMethodsRepository {}

class PaymentMethodsRepository extends BaseRepository
    implements IPaymentMethodsRepository {
  PaymentMethodsRepository({required this.provider});

  final IPaymentMethodsApiProvider provider;
}
