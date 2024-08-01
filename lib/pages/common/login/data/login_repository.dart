import 'package:umra/base/base_repositroy.dart';
import 'package:umra/pages/common/login/model/login_response_model.dart';
import 'package:umra/services/auth_service.dart';
import 'package:get/get.dart';


import 'login_api_provider.dart';

abstract class ILoginRepository {
  Future<LoginResponseModel> login(String email , String password) ;
}

class LoginRepository extends BaseRepository implements ILoginRepository {
  LoginRepository({required this.provider});
  final ILoginProvider provider;

  @override
  Future<LoginResponseModel> login(String userName, String password) async{

    final apiResponse = await provider.loginWithEmailAndPassword(userName, password) ;
    printInfo(info: apiResponse.bodyString!);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if(apiResponse.isOk && apiResponse.body != null){
      AuthService.to.login(apiResponse.body!);
      return apiResponse.body! ;
    }else {
      print("apiResponse.body!.msg ${apiResponse.bodyString}");
      throw(getErrorMessage(apiResponse.bodyString!)) ;
    }
  }
}
