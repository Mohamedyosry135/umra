// ignore: one_member_abstracts
import 'package:umra/base/api_end_points.dart';
import 'package:umra/base/base_auth_provider.dart';
import 'package:umra/flavors/flavor_config.dart';
import 'package:umra/pages/common/login/model/login_response_model.dart';
import 'package:umra/services/auth_service.dart';
import 'package:get/get.dart';


abstract class ILoginProvider {
  Future<Response<LoginResponseModel>> loginWithEmailAndPassword(
      String userName, String password);
}

class LoginProvider extends BaseAuthProvider implements ILoginProvider {
  @override
  Future<Response<LoginResponseModel>> loginWithEmailAndPassword(
      String userName, String password) async{
    final languageApp = AuthService.to.language;
    print({
      "userName": userName,
      "password": password,
    }.toString());
    Response<LoginResponseModel> resp = await post<LoginResponseModel>(
      Get.find<MyFlavorConfig>().appNameEnum == AppNameEnum.user ? UserEndPoints.loginEndPoint : ProviderEndPoints.loginEndPoint,
        {
          "userName": userName,
          "password": password,
        },
        decoder: LoginResponseModel.fromJson,
    );

    return resp;
  }
}
