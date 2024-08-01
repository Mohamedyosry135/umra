import 'package:umra/base/base_repositroy.dart';
import 'package:umra/pages/user/urmah_list/data/umrah_list_api_provider.dart';
import 'package:umra/pages/user/urmah_list/models/umra_package_list_model.dart';

abstract class IUmrahListRepository {
  Future<UmrahPackageListModel> getUmraPackageList();
}

class UmrahListRepository extends BaseRepository
    implements IUmrahListRepository {
  UmrahListRepository({required this.provider});
  final IUmrahListApiProvider provider;

  @override
  Future<UmrahPackageListModel> getUmraPackageList() async {
    final apiResponse = await provider.getUmraPackageList();
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk && apiResponse.body != null) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.statusCode!}");
      print("apiResponse.body!.msg ${apiResponse.body!}");
      throw (getErrorMessage(apiResponse.body.toString()));
    }
  }
}
