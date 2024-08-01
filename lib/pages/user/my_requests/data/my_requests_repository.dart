import 'package:umra/base/base_repositroy.dart';
import 'package:umra/pages/user/my_beneficiary/data/my_beneficiary_api_provider.dart';
import 'package:umra/pages/user/my_beneficiary/models/relationships_model_resp.dart';
import 'package:umra/pages/user/my_requests/data/my_requests_api_provider.dart';
import 'package:umra/pages/user/my_requests/models/my_request_model.dart';

abstract class IMyRequestsRepository {
  Future<MyUmraRequestsModel> getRequests();
  // Future<RelationshipsModelResp> getRelationships();
}

class MyRequestsRepository extends BaseRepository
    implements IMyRequestsRepository {
  MyRequestsRepository({required this.provider});
  final IMyRequestsApiProvider provider;

  @override
  Future<MyUmraRequestsModel> getRequests() async {
    final apiResponse = await provider.getRequests();
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk && apiResponse.body != null) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.bodyString}");
      throw (getErrorMessage(apiResponse.bodyString ?? ""));
    }
  }

  // @override
  // Future<RelationshipsModelResp> getRelationships() async {
  //   final apiResponse = await provider.getRelationships();
  //   print("apiResponse.isOk ${apiResponse.isOk}");
  //   if (apiResponse.isOk && apiResponse.body != null) {
  //     return apiResponse.body!;
  //   } else {
  //     print("apiResponse.body!.msg ${apiResponse.bodyString}");
  //     throw (getErrorMessage(apiResponse.bodyString!));
  //   }
  // }
}
