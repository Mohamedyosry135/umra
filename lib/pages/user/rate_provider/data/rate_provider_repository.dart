import 'package:umra/base/base_repositroy.dart';
import 'package:umra/pages/user/rate_provider/data/rate_provider_api_provider.dart';
import 'package:umra/pages/user/track_order/data/track_order_api_provider.dart';

abstract class IRateProivderRepository {}

class RateProivderRepository extends BaseRepository
    implements IRateProivderRepository {
  RateProivderRepository({required this.provider});

  final IRateProivderApiProvider provider;
}
