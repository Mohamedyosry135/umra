import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:umra/base/base_repositroy.dart';
import 'package:umra/pages/common/signup/model/image_response_model.dart';
import 'package:umra/pages/provider/track_order/data/provider_track_order_api_provider.dart';
import 'package:umra/pages/provider/track_order/model/update_step_model.dart';
import 'package:umra/pages/user/track_order/data/track_order_api_provider.dart';
import 'package:umra/pages/user/track_order/model/umrah_details_model.dart';
import 'package:umra/services/auth_service.dart';

abstract class IProviderTrackOrderRepository {
  Future<UmrahDetailsModel> getUmrahDetails(String id);
  Future<UmrahDetailsModel> endUmrah(String id);
  Future<UmrahDetailsModel> updateUmrahStep(UpdateStepModel stepModel);
  Future<ImageResponseModel> uploadPhoto(File file);

}

class ProviderTrackOrderRepository extends BaseRepository implements IProviderTrackOrderRepository {
  ProviderTrackOrderRepository({required this.provider});
  final IProviderTrackOrderApiProvider provider;
  @override
  Future<UmrahDetailsModel> getUmrahDetails(String id) async {
    final apiResponse = await provider.getUmrahDetails(id);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk && apiResponse.body != null) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.body!}");
      throw (getErrorMessage(apiResponse.body.toString()));
    }
  }
  @override
  Future<UmrahDetailsModel> endUmrah(String id) async {
    final apiResponse = await provider.endUmrah(id);
    print("apiResponse.isOk ${apiResponse.isOk}");
    print("apiResponse.isOk ${apiResponse.statusCode}");
      return apiResponse.body!;
  }

  @override
  Future<ImageResponseModel> uploadPhoto(File file) async{
    final apiResponse = await provider.uploadPhoto(file) ;
    // printInfo(info: apiResponse.data ?? "");
    print("apiResponse.isOk ${apiResponse.statusCode}");
    if(apiResponse.statusCode==200 ){
      print("true success");
      ImageResponseModel imageResponseModel = ImageResponseModel.fromJson(apiResponse.data);
      return imageResponseModel;
    }else{
      print("error");
      print(apiResponse.data.toString());
      throw(getErrorMessage(apiResponse.data)) ;
    }
  }

  @override
  Future<UmrahDetailsModel> updateUmrahStep(UpdateStepModel stepModel) async {
    final apiResponse = await provider.updateUmrahStep(stepModel);
    print("apiResponse.isOk ${apiResponse.isOk}");
    if (apiResponse.isOk && apiResponse.body != null) {
      return apiResponse.body!;
    } else {
      print("apiResponse.body!.msg ${apiResponse.body!}");
      throw (getErrorMessage(apiResponse.body.toString()));
    }
  }
}
