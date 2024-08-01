// ignore: one_member_abstracts
import 'package:umra/base/api_end_points.dart';
import 'package:umra/base/base_auth_provider.dart';
import 'package:umra/flavors/flavor_config.dart';
 
import 'package:umra/services/auth_service.dart';
import 'package:get/get.dart';

import '../../login/model/login_response_model.dart';


abstract class IVerificationCodeProvider {
  Future<Response<LoginResponseModel>> verifyCode(
      String code);
}

class VerificationCodeProvider extends BaseAuthProvider implements IVerificationCodeProvider {
  @override
  Future<Response<LoginResponseModel>> verifyCode(String code) {
      return post(
          Get.find<MyFlavorConfig>().appNameEnum == AppNameEnum.user ? UserEndPoints.verifyCode : ProviderEndPoints.verifyCode,

          {
          "verificationCode": code
        },decoder: LoginResponseModel.fromJson

      );
  }

}
