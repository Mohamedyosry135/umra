import 'package:get/get.dart';
import 'package:umra/base/api_end_points.dart';
import 'package:umra/base/base_auth_provider.dart';
import 'package:umra/pages/user/provider_list/models/search_providers_list.dart';
import 'package:umra/services/auth_service.dart';

abstract class IProviderListApiProvider {
  Future<Response<SearchUmrahPackageRequestModel>> getUmraProvidersList(
      String umrahPackageId, String requestDate);
}

class ProviderListApiProvider extends BaseAuthProvider
    implements IProviderListApiProvider {
  @override
  Future<Response<SearchUmrahPackageRequestModel>> getUmraProvidersList(
      String umrahPackageId, String requestDate) {
    print("${{
      "UmrahPackageId" : umrahPackageId,
      "RequestDate" : requestDate
    }}");
    return post<SearchUmrahPackageRequestModel>(
      UserEndPoints.getSearchUmrahPackageReques,
      {
        "UmrahPackageId" : umrahPackageId,
        "RequestDate" : requestDate
      },
      decoder: SearchUmrahPackageRequestModel.fromJson,
    );
  }
}
