import 'package:umra/base/base_repositroy.dart';
import 'package:umra/pages/user/add_beneficiary/data/add_beneficiary_api_provider.dart';
import 'package:umra/pages/user/add_beneficiary/models/add_beneficiary_model_resp.dart';


abstract class IAddBeneficiaryRepository {
  Future<BeneficiaryAddResp> addBeneficiary(String name, int gender, String birthDay, int relationship, int country);

}

class AddBeneficiaryRepository extends BaseRepository implements IAddBeneficiaryRepository {
  AddBeneficiaryRepository({required this.provider});
  final IAddBeneficiaryApiProvider provider;

  @override
  Future<BeneficiaryAddResp> addBeneficiary(String name, int gender, String birthDay, int relationship, int country) async{
    final apiResponse = await provider.addBeneficiary(name, gender, birthDay, relationship, country) ;
    print("apiResponse.isOk ${apiResponse.isOk}");
    if(apiResponse.isOk && apiResponse.body != null){
      return apiResponse.body! ;
    }else {
      print("apiResponse.body!.msg ${apiResponse.bodyString}");
      throw(getErrorMessage(apiResponse.bodyString!)) ;
    }
  }


}
