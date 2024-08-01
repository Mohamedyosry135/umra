import 'dart:io';

import 'package:umra/base/base_repositroy.dart';
import 'package:umra/flavors/flavor_config.dart';
import 'package:umra/pages/common/login/model/login_response_model.dart';
import 'package:umra/pages/common/signup/model/image_response_model.dart';
 
import 'package:umra/services/auth_service.dart';
import 'package:get/get.dart';


import 'signup_api_provider.dart';

abstract class IsignupRepository {
  Future<LoginResponseModel> addUser(String fullName,String userName,
      String email, String password);

  Future<ImageResponseModel>uploadPhoto(File image,String token);
}

class signupRepository extends BaseRepository implements IsignupRepository {
  signupRepository({required this.provider});
  final IsignupProvider provider;

  @override
  Future<LoginResponseModel> addUser(String fullName, String userName, String email, String password) async{
    final apiResponse = await provider.addUser(fullName, userName, email, password);
    printInfo(info: apiResponse.bodyString ??"NO");
    print("apiResponse.isOk ${apiResponse.isOk}");
    if(apiResponse.isOk && apiResponse.body != null){
      AuthService.to.userInfo = apiResponse.body!;


      return apiResponse.body! ;
    }else {
      print("apiResponse.body!.msg ${apiResponse.bodyString!}");
      throw(getErrorMessage(apiResponse.bodyString!)) ;
    }
  }

  @override
  Future<ImageResponseModel> uploadPhoto(File image, String token) async{
    final apiResponse = await provider.uploadPhoto(image,token) ;
    // printInfo(info: apiResponse.data ?? "");
    print("apiResponse.isOk ${apiResponse.statusCode}");
    if(apiResponse.statusCode==200 ){
      print("true success");

      ImageResponseModel imageResponseModel = ImageResponseModel.fromJson(apiResponse.data);
      AuthService.to.addImage(imageResponseModel.data![0]);
      return imageResponseModel;
    }else{
      print("error");
      print(apiResponse.data.toString());
      throw(getErrorMessage(apiResponse.data)) ;
    }
  }


}
