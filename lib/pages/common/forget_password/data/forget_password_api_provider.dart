import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:umra/base/api_end_points.dart';
import 'package:umra/base/base_auth_provider.dart';
import 'package:umra/flavors/flavor_config.dart';
import 'package:umra/pages/common/forget_password/models/empty_model.dart';
import 'package:umra/pages/common/login/model/login_response_model.dart';
import 'package:umra/services/auth_service.dart';

import '../../../../base/base_auth_provider.dart';

abstract class IForgetPasswordProvider {
  Future<Response<EmptyModel>> resetPassword(String email);
}

class ForgetPasswordProvider extends BaseAuthProvider
    implements IForgetPasswordProvider {
  @override
  Future<Response<EmptyModel>> resetPassword(String email) async {
    print({
      "password": email,
    }.toString());
    Response<EmptyModel> resp = await post<EmptyModel>(
      Get.find<MyFlavorConfig>().appNameEnum == AppNameEnum.user
          ? UserEndPoints.forgetPassword
          : ProviderEndPoints.forgetPassword,
      {
        "email": email,
      },
      decoder: EmptyModel.fromJson,
    );

    return resp;
  }
}
