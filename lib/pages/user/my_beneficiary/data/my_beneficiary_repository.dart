import 'package:umra/base/base_repositroy.dart';
import 'package:umra/pages/common/next_signup/model/country_city_response_model.dart';
import 'package:umra/pages/user/my_beneficiary/data/my_beneficiary_api_provider.dart';
import 'package:umra/pages/user/my_beneficiary/models/all_beneficiary_model_resp.dart';
import 'package:umra/pages/user/my_beneficiary/models/gender_model_resp.dart';
import 'package:umra/pages/user/my_beneficiary/models/relationships_model_resp.dart';

abstract class IMyBeneficiaryRepository {
  Future<GenderModelResp> getGenders();
  Future<CountryCityResponseModel> getCountriesCities();
  Future<AllBeneficiaryModelResp> getAllBeneficiary();
  Future<RelationshipsModelResp> getRelationships();
}

class MyBeneficiaryRepository extends BaseRepository
    implements IMyBeneficiaryRepository {
  MyBeneficiaryRepository({required this.provider});
  final IMyBeneficiaryApiProvider provider;

  @override
  Future<AllBeneficiaryModelResp> getAllBeneficiary() async {
    final apiResponse = await provider.getAllBeneficiary();
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk && apiResponse.body != null) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.bodyString}");
      throw (getErrorMessage(apiResponse.bodyString!));
    }
  }

  @override
  Future<CountryCityResponseModel> getCountriesCities() async {
    final apiResponse = await provider.getCountriesCities();
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk && apiResponse.body != null) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.bodyString}");
      throw (getErrorMessage(apiResponse.bodyString!));
    }
  }

  @override
  Future<GenderModelResp> getGenders() async {
    final apiResponse = await provider.getGenders();
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk && apiResponse.body != null) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.bodyString}");
      throw (getErrorMessage(apiResponse.bodyString!));
    }
  }

  @override
  Future<RelationshipsModelResp> getRelationships() async {
    final apiResponse = await provider.getRelationships();
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk && apiResponse.body != null) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.bodyString}");
      throw (getErrorMessage(apiResponse.bodyString!));
    }
  }
}
