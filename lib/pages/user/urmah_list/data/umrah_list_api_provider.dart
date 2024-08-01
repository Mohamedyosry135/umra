import 'package:get/get.dart';
import 'package:umra/base/api_end_points.dart';
import 'package:umra/base/base_auth_provider.dart';
import 'package:umra/pages/user/urmah_list/models/umra_package_list_model.dart';
import 'package:umra/services/auth_service.dart';

abstract class IUmrahListApiProvider {
  Future<Response<UmrahPackageListModel>> getUmraPackageList();
}

class UmrahListApiProvider extends BaseAuthProvider
    implements IUmrahListApiProvider {
  @override
  Future<Response<UmrahPackageListModel>> getUmraPackageList() {
    return post<UmrahPackageListModel>(
      UserEndPoints.getUmraPackageList,
      {"language": AuthService.to.language},
      decoder: UmrahPackageListModel.fromJson,
    );
  }
}
