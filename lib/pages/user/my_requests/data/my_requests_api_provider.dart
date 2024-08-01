  import 'package:get/get.dart';
import 'package:umra/base/api_end_points.dart';
import 'package:umra/base/base_auth_provider.dart';
import 'package:umra/pages/user/my_beneficiary/models/relationships_model_resp.dart';
import 'package:umra/pages/user/my_requests/models/my_request_model.dart';

abstract class IMyRequestsApiProvider {
  Future<Response<MyUmraRequestsModel>> getRequests();
  // Future<Response<RelationshipsModelResp>> getRelationships();
}

class MyRequestsApiProvider extends BaseAuthProvider
    implements IMyRequestsApiProvider {
  @override
  Future<Response<MyUmraRequestsModel>> getRequests() {
    return post<MyUmraRequestsModel>(
      UserEndPoints.getUmrahRequests,
      {},
      decoder: MyUmraRequestsModel.fromJson,
    );
  }

  // @override
  // Future<Response<RelationshipsModelResp>> getRelationships() {
  //   return get<RelationshipsModelResp>(
  //     'StaticData/GetRelationShips',
  //     decoder: RelationshipsModelResp.fromJson,
  //   );
  // }
}
