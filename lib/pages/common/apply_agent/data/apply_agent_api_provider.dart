import 'package:get/get.dart';
import 'package:umra/base/base_auth_provider.dart';
import 'package:umra/pages/common/apply_agent/model/identity_type_model.dart';
import 'package:umra/pages/common/apply_agent/model/nationality_type_model.dart';
import 'package:umra/pages/common/apply_agent/model/request_model_final_step.dart';
import 'package:umra/pages/common/next_signup/model/add_user_model.dart';
import 'package:umra/services/auth_service.dart';

abstract class IApplyAgentProvider {
  Future<Response<NationalityTypeModel>> getNationalities();

  Future<Response<IdentityTypeModel>> getIdentitiesType();

  //any model till the backend dev send the real model
  Future<Response<AddUserModel>> addUserFinalStep(RequestModelFinalStep requestModelFinalStep);

}

class ApplyAgentProvider extends BaseAuthProvider
    implements IApplyAgentProvider {
  @override
  Future<Response<IdentityTypeModel>> getIdentitiesType() async{
    try{
      Response<IdentityTypeModel> res= await  get(
          "StaticData/GetIdentityTypes",

          decoder: IdentityTypeModel.fromJson);
      return res;
    }catch(e){
      print("e  ${e.toString()}");
      throw(e);
    }
  }

  @override
  Future<Response<NationalityTypeModel>> getNationalities() {
    return post(
        "Nationality/GetAll",
        {
          "language": AuthService.to.language,
        },
        decoder: NationalityTypeModel.fromJson);

  }

  @override
  Future<Response<AddUserModel>> addUserFinalStep(RequestModelFinalStep) {
    return post(
        "ProviderAppUser/AddUserFinalStep",
        RequestModelFinalStep.toJson(),
        decoder: AddUserModel.fromJson);
  }
}
