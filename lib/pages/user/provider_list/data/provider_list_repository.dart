import 'package:umra/base/base_repositroy.dart';
import 'package:umra/pages/user/provider_list/data/provider_list_api_provider.dart';
import 'package:umra/pages/user/provider_list/models/search_providers_list.dart';

abstract class IProviderListRepository {
  Future<SearchUmrahPackageRequestModel> getUmraProvidersList(String umrahPackageId, String requestDate);
}

class ProviderListRepository extends BaseRepository
    implements IProviderListRepository {
  ProviderListRepository({required this.provider});
  final IProviderListApiProvider provider;

  @override
  Future<SearchUmrahPackageRequestModel> getUmraProvidersList(
      String umrahPackageId, String requestDate) async {
    final apiResponse =
        await provider.getUmraProvidersList(umrahPackageId, requestDate);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk && apiResponse.body != null) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.body}");
      throw (getErrorMessage(apiResponse.body.toString()));
    }
  }
}
