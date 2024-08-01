import 'package:get/get.dart';
import 'package:umra/base/base_repositroy.dart';
import 'package:umra/pages/common/my_profile/data/my_profile_api_provider.dart';
import 'package:umra/pages/common/my_profile/models/profile_model.dart';


abstract class IMyProfileRepository {
  Future<ProfileModel> getProfile();

}

class MyProfileRepository extends BaseRepository implements IMyProfileRepository {
  MyProfileRepository({required this.provider});
  final IMyProfileProvider provider;

  @override
  Future<ProfileModel> getProfile() async{
    final apiResponse = await provider.getProfile( ) ;
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
