import 'package:umra/base/base_repositroy.dart';
import 'package:umra/pages/common/apply_agent/model/identity_type_model.dart';
import 'package:umra/pages/common/apply_agent/model/nationality_type_model.dart';
import 'package:umra/pages/common/apply_agent/model/request_model_final_step.dart';
import 'package:umra/pages/common/next_signup/model/add_user_model.dart';
 
import 'package:umra/services/auth_service.dart';
import 'package:get/get.dart';


import 'apply_agent_api_provider.dart';

abstract class IapplyagentRepository {
  Future<NationalityTypeModel> getNationalities();

  Future<IdentityTypeModel> getIdentitiesType();

  Future<AddUserModel> addUserFinalStep(RequestModelFinalStep requestModelFinalStep);

}

class applyagentRepository extends BaseRepository implements IapplyagentRepository {
  applyagentRepository({required this.provider});
  final IApplyAgentProvider provider;

  @override
  Future<IdentityTypeModel> getIdentitiesType() async{
    print("getIdentitiesType");
    final apiResponse = await provider.getIdentitiesType() ;
    printInfo(info: apiResponse.bodyString!);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if(apiResponse.isOk && apiResponse.body != null){
      return apiResponse.body! ;
    }else {
      print("apiResponse.body!.msg ${apiResponse.bodyString}");
      throw(getErrorMessage(apiResponse.bodyString!)) ;
    }
  }

  @override
  Future<NationalityTypeModel> getNationalities() async{
    print("getNationalities");

    final apiResponse = await provider.getNationalities() ;
    printInfo(info: apiResponse.bodyString!);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if(apiResponse.isOk && apiResponse.body != null){
      return apiResponse.body! ;
    }else {
      print("apiResponse.body!.msg ${apiResponse.bodyString}");
      throw(getErrorMessage(apiResponse.bodyString!)) ;
    }
  }

  @override
  Future<AddUserModel> addUserFinalStep(RequestModelFinalStep requestModelFinalStep) async{
    print("addUserFinalStep");

    final apiResponse = await provider.addUserFinalStep(requestModelFinalStep) ;
    printInfo(info: apiResponse.bodyString!);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if(apiResponse.isOk && apiResponse.body != null){
      return apiResponse.body! ;
    }else {
      print("apiResponse.addUserFinalStep!.msg ${apiResponse.bodyString}");
      throw(getErrorMessage(apiResponse.bodyString!)) ;
    }
  }


}
