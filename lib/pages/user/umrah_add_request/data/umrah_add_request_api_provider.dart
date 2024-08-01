import 'package:get/get.dart';
import 'package:umra/base/api_end_points.dart';
import 'package:umra/base/base_auth_provider.dart';
import 'package:umra/pages/common/login/model/login_response_model.dart';
import 'package:umra/pages/user/my_beneficiary/models/relationships_model_resp.dart';
import 'package:umra/pages/user/umrah_add_request/models/static_reason_model.dart';
import 'package:umra/pages/user/umrah_add_request/models/send_umra_request_model.dart';
import 'package:umra/pages/user/umrah_add_request/models/umra_request_model.dart';
import 'package:umra/services/auth_service.dart';

import '../../my_beneficiary/models/all_beneficiary_model_resp.dart';
import '../models/check_promo_code_model.dart';

abstract class IUmrahAddRequestApiProvider {
  // Future<Response<AllBeneficiaryModelResp>> getAllBeneficiary();
  // Future<Response<RelationshipsModelResp>> getRelationships();
  Future<Response<StaticReasonModel>> getReasons();
  Future<Response<UmraRequestModel>> sendRequest(SendUmraRequestModel model);
  Future<Response<CheckPromoCodeModel>> checkPromoCode(String code);
}

class UmrahAddRequestApiProvider extends BaseAuthProvider
    implements IUmrahAddRequestApiProvider {
  @override
  // Future<Response<AllBeneficiaryModelResp>> getAllBeneficiary() {
  //   return post<AllBeneficiaryModelResp>(
  //     UserEndPoints.allBeneficiary,
  //     {"language": AuthService.to.language},
  //     decoder: AllBeneficiaryModelResp.fromJson,
  //   );
  // }
  //
  // @override
  // Future<Response<RelationshipsModelResp>> getRelationships() {
  //   return get<RelationshipsModelResp>(
  //     'StaticData/GetRelationShips',
  //     decoder: RelationshipsModelResp.fromJson,
  //   );
  // }

  @override
  Future<Response<StaticReasonModel>> getReasons() {
    return get<StaticReasonModel>(
      'StaticData/GetEnumReason',
      decoder: StaticReasonModel.fromJson,
    );
  }

  @override
  Future<Response<UmraRequestModel>> sendRequest(SendUmraRequestModel model) {
    print("model ${model.toJson()}");
    return post<UmraRequestModel>(
      UserEndPoints.sendUmrahRequest,
      model.toJson(),
      decoder: UmraRequestModel.fromJson,
    );
  }

  @override
  Future<Response<CheckPromoCodeModel>> checkPromoCode(String code) {
    return get(
      '${UserEndPoints.checkPromoCode}$code',
      decoder: CheckPromoCodeModel.fromJson

    );
  }
}
