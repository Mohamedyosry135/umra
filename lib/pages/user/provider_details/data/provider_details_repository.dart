import 'package:umra/base/base_repositroy.dart';
import 'package:umra/pages/user/provider_details/data/provider_details_api_provider.dart';
import 'package:umra/pages/user/provider_details/model/provider_rate_model.dart';
import 'package:umra/pages/user/provider_list/data/provider_list_api_provider.dart';


abstract class IProviderDetailsRepository {
  Future<ProviderRateModel> getProviderRate(String providerId);

}

class ProviderDetailsRepository extends BaseRepository implements IProviderDetailsRepository {
  ProviderDetailsRepository({required this.provider});
  final IProviderDetailsApiProvider provider;

  @override
  Future<ProviderRateModel> getProviderRate(String providerId) async {
    final apiResponse =
    await provider.getProviderRate(providerId);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk && apiResponse.body != null) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.body}");
      throw (getErrorMessage(apiResponse.body.toString()));
    }
  }
}
