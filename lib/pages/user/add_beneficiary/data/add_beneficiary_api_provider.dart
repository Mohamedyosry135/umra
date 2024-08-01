import 'package:get/get_connect/http/src/response/response.dart';
import 'package:umra/base/api_end_points.dart';
import 'package:umra/base/base_auth_provider.dart';
import 'package:umra/pages/user/add_beneficiary/models/add_beneficiary_model_resp.dart';

abstract class IAddBeneficiaryApiProvider {
  Future<Response<BeneficiaryAddResp>> addBeneficiary(String name, int gender, String birthDay, int relationship, int country);
}

class AddBeneficiaryApiProvider extends BaseAuthProvider
    implements IAddBeneficiaryApiProvider {
  @override
  Future<Response<BeneficiaryAddResp>> addBeneficiary(String name, int gender, String birthDay, int relationship, int country) {
    return post<BeneficiaryAddResp>(
      UserEndPoints.addBeneficiary,
      {
        "legalName": name,
        "gender": gender,
        "birthday": birthDay,
        "relationShip": relationship,
        "residenceCountryId": country
      },
      decoder: BeneficiaryAddResp.fromJson,
    );
  }
}
