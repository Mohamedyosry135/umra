import 'package:get/get_connect/http/src/response/response.dart';
import 'package:umra/base/api_end_points.dart';
import 'package:umra/base/base_auth_provider.dart';
import 'package:umra/pages/provider/my_days/models/provider_dates_model.dart';
import 'package:umra/pages/provider/my_days/models/umra_package_model.dart';
import 'package:umra/services/auth_service.dart';

abstract class IMyDaysApiProvider {
  Future<Response<ProviderDatesModel>> getProviderAvailbleDates(int packageId);
  Future<Response<UmraPackageModel>> getProviderUmraPackages();
  Future postProviderUmradays(dynamic data);
  Future updateProviderUmradays(dynamic data);
}

class MyDaysApiProvider extends BaseAuthProvider implements IMyDaysApiProvider {
  @override
  Future<Response<ProviderDatesModel>> getProviderAvailbleDates(int packageId) {
    return get<ProviderDatesModel>(
      '${ProviderEndPoints.getProviderAvailbleDates}$packageId',
      decoder: ProviderDatesModel.fromJson,
    );
  }

  @override
  Future<Response<UmraPackageModel>> getProviderUmraPackages() {
    return post<UmraPackageModel>(
      ProviderEndPoints.getProviderUmraPackages,
      {"language": AuthService.to.language.toString()},
      decoder: UmraPackageModel.fromJson
    );
  }

  @override
  Future postProviderUmradays(dynamic data) {
    return post(
        ProviderEndPoints.postProviderUmraDays,
        data,

    );
  }

  @override
  Future updateProviderUmradays(data) {
    return post(
      ProviderEndPoints.updateProviderUmraDays,
      data,

    );
  }
}
