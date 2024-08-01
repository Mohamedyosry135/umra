// ignore: one_member_abstracts
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:umra/base/api_end_points.dart';
import 'package:umra/base/base_auth_provider.dart';
import 'package:umra/flavors/flavor_config.dart';
import 'package:umra/pages/common/login/model/login_response_model.dart';
 
import 'package:umra/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:dio/src/response.dart' as RESPONE;
import 'package:dio/dio.dart' as DIO;

abstract class IsignupProvider {
  Future<Response<LoginResponseModel>> addUser(String fullName,String userName,
      String email, String password);
  Future<RESPONE.Response>uploadPhoto(File image,String token);
}

class signupProvider extends BaseAuthProvider implements IsignupProvider {
  @override
  Future<Response<LoginResponseModel>> addUser(String fullName, String userName, String email, String password) {
    print({
      "fullName": fullName,
      "email": email,
      "userName": userName,
      "password": password
    });
    return post<LoginResponseModel>(
        Get.find<MyFlavorConfig>().appNameEnum == AppNameEnum.user ? UserEndPoints.addUser : ProviderEndPoints.addUser,

        {
          "fullName": fullName,
          "email": email,
          "userName": userName,
          "password": password
        },
          decoder: LoginResponseModel.fromJson,
      );
  }

  @override
  Future<RESPONE.Response> uploadPhoto(File image,String token) async{

    print(token);
  DIO.Dio dio = DIO.Dio(DIO.BaseOptions(
    baseUrl:"",
  ));
  dio.options.headers = {
  'Content-Type': 'multipart/form-data',
    'Lang': AuthService.to.language,
    "Authorization":"Bearer ${token}",
    "Accept":"*/*"
  };
  print("image path : ${image.path
      .split('/')
      .last}");

  DIO.FormData formData = DIO.FormData.fromMap({
    "IsThumbnail":"true",
    "Files": DIO.MultipartFile.fromBytes(
        image.readAsBytesSync(),
        filename: image.path.split('/').last),
    "AllowedFiles":"jpg,jpeg,png"
  });
  debugPrint(formData.fields.toString());

    RESPONE.Response resp= await dio.post("https://hubadal.com/api/Attachment/AddAttachmentsList",
        data: formData,
        options: DIO.Options(
            headers: {
              'Content-Type': 'multipart/form-data',
              'Lang': AuthService.to.language,
              "Authorization":"Bearer ${token}",
              "Accept":"*/*"
            }
        ));
  // RESPONE.Response resp = await dio.post("Attachment/AddAttachmentsList",data: formData);

  print("resp.statusCode ${resp.statusCode}");
  return resp;
  }

}
