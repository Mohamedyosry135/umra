// ignore: one_member_abstracts
import 'package:umra/base/api_end_points.dart';
import 'package:umra/base/base_auth_provider.dart';
import 'package:umra/flavors/flavor_config.dart';
import 'package:umra/pages/common/login/model/login_response_model.dart';
import 'package:umra/pages/common/next_signup/model/add_user_model.dart';
import 'package:umra/pages/common/next_signup/model/country_city_response_model.dart';
 
import 'package:umra/services/auth_service.dart';
import 'package:get/get.dart';


abstract class InextsignupProvider {
  Future<Response<AddUserModel>> updateProfileUser(int residenceCountryId, int cityId,String phoneNumber, String address);
  Future<Response<CountryCityResponseModel>> getCountriesWithCity();

}

class nextsignupProvider extends BaseAuthProvider implements InextsignupProvider {
  @override
  Future<Response<AddUserModel>> updateProfileUser(int residenceCountryId, int cityId,String phoneNumber, String address) {
    print({
      "id":AuthService.to.userInfo?.data?.appUsers?.id,
      "fullName": AuthService.to.userInfo?.data?.appUsers?.fullName,
      "residenceCountryId": residenceCountryId,
      "cityId": cityId,
      "phoneNumber": phoneNumber,
      "address": address,
      "profileAttachmentId": AuthService.to.imageModel?.id
    });
    return post(
        Get.find<MyFlavorConfig>().appNameEnum == AppNameEnum.user ? UserEndPoints.updateProfile : ProviderEndPoints.updateProfile,
        {
          "id":AuthService.to.userInfo?.data?.appUsers?.id,
          "fullName": AuthService.to.userInfo?.data?.appUsers?.fullName,
          "residenceCountryId": residenceCountryId,
          "cityId": cityId,
          "phoneNumber": phoneNumber,
          "address": address,
          "profileAttachmentId": AuthService.to.imageModel?.id
        },
      decoder: AddUserModel.fromJson

    );
  }

  @override
  Future<Response<CountryCityResponseModel>> getCountriesWithCity() {
    return post(
       "Country/GetAllWithCities",
        {
          "language":AuthService.to.language,
        },
        decoder: CountryCityResponseModel.fromJson

    );
  }
}
