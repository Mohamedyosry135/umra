import 'package:umra/base/base_repositroy.dart';
import 'package:umra/pages/provider/provider_home/data/provider_home_api_provider.dart';
import 'package:umra/pages/user/user_home/data/user_home_api_provider.dart';

import '../../../user/my_requests/models/my_request_model.dart';


abstract class IproviderHomeRepository {
  Future<MyUmraRequestsModel> getRequests();
}

class providerHomeRepository extends BaseRepository implements IproviderHomeRepository {
  providerHomeRepository({required this.provider});
  final IproviderHomeApiProvider provider;

  @override
  Future<MyUmraRequestsModel> getRequests() async{
    final apiResponse = await provider.getRequests();
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk && apiResponse.body != null) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.bodyString}");
      throw (getErrorMessage(apiResponse.bodyString!));
    }
  }




}
