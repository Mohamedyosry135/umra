import 'package:get/get_connect/http/src/response/response.dart';
import 'package:umra/base/api_end_points.dart';
import 'package:umra/base/base_auth_provider.dart';
import 'package:umra/pages/common/next_signup/model/country_city_response_model.dart';
import 'package:umra/pages/user/my_beneficiary/models/all_beneficiary_model_resp.dart';
import 'package:umra/pages/user/my_beneficiary/models/gender_model_resp.dart';
import 'package:umra/pages/user/my_beneficiary/models/relationships_model_resp.dart';
import 'package:umra/services/auth_service.dart';

abstract class IMyBeneficiaryApiProvider {
  Future<Response<GenderModelResp>> getGenders();
  Future<Response<CountryCityResponseModel>> getCountriesCities();
  Future<Response<AllBeneficiaryModelResp>> getAllBeneficiary();
  Future<Response<RelationshipsModelResp>> getRelationships();
}

class MyBeneficiaryApiProvider extends BaseAuthProvider
    implements IMyBeneficiaryApiProvider {
  @override
  Future<Response<AllBeneficiaryModelResp>> getAllBeneficiary() {
    return post<AllBeneficiaryModelResp>(
      UserEndPoints.allBeneficiary,
      {"language": AuthService.to.language},
      decoder: AllBeneficiaryModelResp.fromJson,
    );
  }

  @override
  Future<Response<CountryCityResponseModel>> getCountriesCities() {
    return post<CountryCityResponseModel>(
      'Country/GetAllWithCities',
      {"language": AuthService.to.language},
      decoder: CountryCityResponseModel.fromJson,
    );
  }

  @override
  Future<Response<GenderModelResp>> getGenders() {
    return get<GenderModelResp>(
      'StaticData/GetGenders',
      decoder: GenderModelResp.fromJson,
    );
  }

  @override
  Future<Response<RelationshipsModelResp>> getRelationships() {
    return get<RelationshipsModelResp>(
      'StaticData/GetRelationShips',
      decoder: RelationshipsModelResp.fromJson,
    );
  }
}
