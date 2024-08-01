import 'package:umra/base/base_repositroy.dart';
import 'package:umra/flavors/flavor_config.dart';
import 'package:umra/pages/common/login/model/login_response_model.dart';
 
import 'package:umra/pages/common/verification_code/data/verfication_code_api_provider.dart';
import 'package:umra/services/auth_service.dart';
import 'package:get/get.dart';




abstract class IVerificationCodeRepository {
  Future<LoginResponseModel> verifyCode(
      String code);
}

class VerificationCodeRepository extends BaseRepository implements IVerificationCodeRepository {
  VerificationCodeRepository({required this.provider});
  final IVerificationCodeProvider provider;

  @override
  Future<LoginResponseModel> verifyCode(String code) async{
      final apiResponse = await provider.verifyCode(code) ;
      printInfo(info: apiResponse.bodyString!);
      print("apiResponse.isOk ${apiResponse.isOk}");
      if(apiResponse.isOk && apiResponse.body != null){
        if(Get.find<MyFlavorConfig>().appNameEnum == AppNameEnum.provider){
          AuthService.to.userInfo = apiResponse.body!;
        }else{
          AuthService.to.login(apiResponse.body!);
        }
        return apiResponse.body! ;
      }else {
        print("apiResponse.body!.msg ${apiResponse.bodyString!}");
        throw(getErrorMessage(apiResponse.bodyString!)) ;
      }
  }

  // @override
  // Future<LoginResponeModel> login(String email, String password) async{
  //   final apiResponse = await provider.loginWithEmailAndPassword(email, password) ;
  //   printInfo(info: apiResponse.bodyString!);
  //   print("apiResponse.isOk ${apiResponse.isOk}");
  //   if(apiResponse.isOk && apiResponse.body != null){
  //     AuthService.to.login(apiResponse.body!);
  //     return apiResponse.body! ;
  //   }else {
  //     print("apiResponse.body!.msg ${apiResponse.body!.msg}");
  //     throw(getErrorMessage(apiResponse.body!.msg!)) ;
  //   }
  // }
}
