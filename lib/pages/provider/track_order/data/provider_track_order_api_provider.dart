import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mime/mime.dart';
import 'package:umra/base/api_end_points.dart';
import 'package:umra/base/base_auth_provider.dart';
import 'package:umra/pages/provider/track_order/model/update_step_model.dart';
import 'package:umra/pages/user/track_order/model/umrah_details_model.dart';
import 'package:umra/services/auth_service.dart';
import 'package:dio/src/response.dart' as RESPONE;
import 'package:dio/dio.dart' as DIO;
import 'package:http_parser/http_parser.dart';


abstract class IProviderTrackOrderApiProvider {
  Future<Response<UmrahDetailsModel>> getUmrahDetails(String id);
  Future<Response<UmrahDetailsModel>> endUmrah(String id);

  Future<Response<UmrahDetailsModel>> updateUmrahStep(UpdateStepModel stepModel);
  Future<RESPONE.Response>uploadPhoto(File file);

}

class ProviderTrackOrderApiProvider extends BaseAuthProvider implements IProviderTrackOrderApiProvider {
  @override
  Future<Response<UmrahDetailsModel>> getUmrahDetails(String id) {
    return get(
      ProviderEndPoints.getUmrahDetails + id,
      headers: {
        "Lang": AuthService.to.language ?? "ar",
      },
      decoder: UmrahDetailsModel.fromJson,
    );
  }
  @override
  Future<Response<UmrahDetailsModel>> endUmrah(String id) {
    return get(
      ProviderEndPoints.endUmrah + id,
      headers: {
        "Lang": AuthService.to.language ?? "ar",
      },
      decoder: UmrahDetailsModel.fromJson,
    );
  }

  @override
  Future<Response<UmrahDetailsModel>> updateUmrahStep(UpdateStepModel stepModel) {
    return post(
      ProviderEndPoints.updateUmrahStep,
      {
        "AttachmentId": stepModel.attachmentId,
        "RequestUmrahId": stepModel.requestUmrahId,
        "RowVersion": stepModel.rowVersion,
        "UmrahPackageStepsId": stepModel.umrahPackageStepsId,
        "UniqueId": stepModel.uniqueId,
        "Id": stepModel.id
      },
      headers: {
        "Lang": AuthService.to.language ?? "ar",
        "Content-Type" : "application/json"
      },
      decoder: UmrahDetailsModel.fromJson,
    );
  }
  @override
  Future<RESPONE.Response> uploadPhoto(File file) async{
     DIO.Dio dio = DIO.Dio(DIO.BaseOptions(
      baseUrl:"",
    ));
    dio.options.headers = {
      'Content-Type': 'multipart/form-data',
      'Lang': AuthService.to.language,
      "Authorization":"Bearer ${AuthService.to.userInfo?.data?.token ?? ""}",
      "Accept":"*/*"
    };
    print("image path : ${file.path.split('/').last}");
    print("image path : ${file.readAsBytesSync()}");
    // Map<String, dynamic> finalData = {
    //   "IsThumbnail":"true",
    //   "Files": DIO.MultipartFile.fromFile(
    //       image.path,
    //       filename: image.path.split('/').last),
    //   "AllowedFiles":"jpg,jpeg,png"
    // };
    // DIO.FormData formData  = DIO.FormData.fromMap({
    //   "file": await DIO.MultipartFile.fromFile(
    //       file.path,
    //       filename: file.path.split("/").last)});

    DIO.FormData formData = DIO.FormData.fromMap({
      // "IsThumbnail/":"true",
      "Files": DIO.MultipartFile.fromBytes(
          file.readAsBytesSync(),
          filename: file.path.split('/').last),
      // "AllowedFiles":"jpg,jpeg,png"
    });
    debugPrint(formData.fields.toString());

    RESPONE.Response resp= await dio.post("https://hubadal.com/api/Attachment/AddAttachmentsList",
        data: formData,
        options: DIO.Options(
            headers: {
              'Content-Type': 'multipart/form-data',
              'Lang': AuthService.to.language,
              "Authorization":"Bearer ${AuthService.to.userInfo?.data?.token ?? ""}",
              "Accept":"*/*"
            }
        ));

    print("resp.statusCode ${resp.statusCode}");
    return resp;
  }

  Future<Uint8List?> compressFile(PlatformFile platformFile) async {
    if (GetUtils.isImage(platformFile.path ?? "")) {
      Uint8List result = await FlutterImageCompress.compressWithList(
        platformFile.bytes!,
        format: CompressFormat.png,
        minWidth: 500,
        minHeight: 500,
        quality: 70,
      );
      return result;
    } else {
      return platformFile.bytes;
    }
  }
}
