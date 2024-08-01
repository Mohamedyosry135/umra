import 'package:get/get.dart';
import 'package:umra/pages/common/forget_password/models/empty_model.dart';

import '../../../../base/base_repositroy.dart';
import 'forget_password_api_provider.dart';

abstract class IForgetPasswordRepository {
  Future<EmptyModel> resetPassword(String email);

}
class ForgetPasswordRepository extends BaseRepository implements IForgetPasswordRepository {
  ForgetPasswordRepository({required this.provider});
  final IForgetPasswordProvider provider;


  @override
  Future<EmptyModel> resetPassword(String email)async {
    final apiResponse = await provider.resetPassword(email) ;
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