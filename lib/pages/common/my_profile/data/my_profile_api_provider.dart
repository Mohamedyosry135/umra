// ignore: one_member_abstracts
import 'package:umra/base/api_end_points.dart';
import 'package:umra/base/base_auth_provider.dart';
import 'package:umra/flavors/flavor_config.dart';
import 'package:umra/pages/common/my_profile/models/profile_model.dart';
 
import 'package:umra/services/auth_service.dart';
import 'package:get/get.dart';


abstract class IMyProfileProvider {
  Future<Response<ProfileModel>> getProfile();
}

class MyProfileProvider extends BaseAuthProvider implements IMyProfileProvider {
  @override
  Future<Response<ProfileModel>> getProfile() async{

    Response<ProfileModel> resp = await get<ProfileModel>(
      Get.find<MyFlavorConfig>().appNameEnum == AppNameEnum.user ? UserEndPoints.profile : ProviderEndPoints.profile,

      decoder: ProfileModel.fromJson,
    );

    return resp;
  }

}
