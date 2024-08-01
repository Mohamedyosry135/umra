import 'package:umra/base/base_repositroy.dart';
import 'package:umra/pages/user/my_beneficiary/models/relationships_model_resp.dart';
import 'package:umra/pages/user/umrah_add_request/data/umrah_add_request_api_provider.dart';
import 'package:umra/pages/user/umrah_add_request/models/send_umra_request_model.dart';
import 'package:umra/pages/user/umrah_add_request/models/static_reason_model.dart';
import 'package:umra/pages/user/umrah_add_request/models/umra_request_model.dart';
import 'package:umra/pages/user/urmah_list/data/umrah_list_api_provider.dart';

import '../../my_beneficiary/models/all_beneficiary_model_resp.dart';

abstract class IUmrahAddRequestRepository {
  // Future<AllBeneficiaryModelResp> getAllBeneficiary();
  // Future<RelationshipsModelResp> getRelationships();
  Future<StaticReasonModel> getReasons();
  Future<UmraRequestModel> sendUmrahRequest(SendUmraRequestModel model);
  Future checkPromoCode(String code);
}

class UmrahAddRequestRepository extends BaseRepository
    implements IUmrahAddRequestRepository {
  UmrahAddRequestRepository({required this.provider});

  final IUmrahAddRequestApiProvider provider;

  // @override
  // Future<AllBeneficiaryModelResp> getAllBeneficiary() async {
  //   final apiResponse = await provider.getAllBeneficiary();
  //   print("apiResponse.isOk ${apiResponse.isOk}");
  //   if (apiResponse.isOk && apiResponse.body != null) {
  //     return apiResponse.body!;
  //   } else {
  //     print("apiResponse.body!.msg ${apiResponse.bodyString}");
  //     throw (getErrorMessage(apiResponse.bodyString!));
  //   }
  // }
  //
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

  @override
  Future<StaticReasonModel> getReasons() async {
    final apiResponse = await provider.getReasons();
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk && apiResponse.body != null) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.bodyString}");
      throw (getErrorMessage(apiResponse.bodyString!));
    }
  }

  @override
  Future<UmraRequestModel> sendUmrahRequest(SendUmraRequestModel model) async {
    final apiResponse = await provider.sendRequest(model);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk && apiResponse.body != null) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.bodyString}");
      throw (getErrorMessage(apiResponse.bodyString!));
    }
  }

  @override
  Future checkPromoCode(String code) async {
    final apiResponse = await provider.checkPromoCode(code);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk && apiResponse.body != null) {
      return apiResponse.body;
    } else {
      print("apiResponse.body!.msg ${apiResponse.bodyString}");
      throw (getErrorMessage(apiResponse.bodyString!));
    }
  }
}
