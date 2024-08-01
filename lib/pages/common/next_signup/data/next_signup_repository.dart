import 'package:umra/base/base_repositroy.dart';
import 'package:umra/pages/common/login/model/login_response_model.dart';
import 'package:umra/pages/common/next_signup/model/add_user_model.dart';
import 'package:umra/pages/common/next_signup/model/country_city_response_model.dart';
 
import 'package:umra/services/auth_service.dart';
import 'package:get/get.dart';


import 'next_signup_api_provider.dart';

abstract class InextsignupRepository {
  Future<AddUserModel> updateProfileUser(int residenceCountryId, int cityId,String phoneNumber, String address);
  Future<CountryCityResponseModel> getCountriesWithCity();
}

class nextsignupRepository extends BaseRepository implements InextsignupRepository {
  nextsignupRepository({required this.provider});
  final InextsignupProvider provider;

  @override
  Future<AddUserModel> updateProfileUser(int residenceCountryId, int cityId, String phoneNumber, String address) async{
      final apiResponse = await provider.updateProfileUser(residenceCountryId, cityId, phoneNumber, address) ;
      printInfo(info: apiResponse.bodyString!);
      print("apiResponse.isOk ${apiResponse.isOk}");
      if(apiResponse.isOk && apiResponse.body != null){
        // AuthService.to.login(apiResponse.body!);
        return apiResponse.body! ;
      }else {
        print("apiResponse.body!.msg ${apiResponse.bodyString}");
        throw(getErrorMessage(apiResponse.bodyString!)) ;
      }
  }

  @override
  Future<CountryCityResponseModel> getCountriesWithCity() async{
    final apiResponse = await provider.getCountriesWithCity() ;
    printInfo(info: apiResponse.bodyString!);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if(apiResponse.isOk && apiResponse.body != null){
      return apiResponse.body! ;
    }else {
      print("apiResponse.body!.msg ${apiResponse.bodyString}");
      throw(getErrorMessage(apiResponse.bodyString!)) ;
    }
  }

}
