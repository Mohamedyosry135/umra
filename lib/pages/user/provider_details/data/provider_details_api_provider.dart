import 'package:get/get.dart';
import 'package:umra/base/api_end_points.dart';
import 'package:umra/base/base_auth_provider.dart';
import 'package:umra/pages/user/provider_details/model/provider_rate_model.dart';

abstract class IProviderDetailsApiProvider {
  Future<Response<ProviderRateModel>> getProviderRate(String providerId);
}

class ProviderDetailsApiProvider extends BaseAuthProvider implements IProviderDetailsApiProvider {
  @override
  Future<Response<ProviderRateModel>> getProviderRate(String providerId) {

    return get<ProviderRateModel>(
      "${UserEndPoints.getProviderRate}/${providerId}",
      decoder: ProviderRateModel.fromJson,
    );
  }
}
