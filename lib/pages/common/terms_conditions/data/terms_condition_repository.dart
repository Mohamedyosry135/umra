

import 'package:get/get.dart';
import 'package:umra/base/base_repositroy.dart';
import 'package:umra/pages/common/terms_conditions/data/terms_condition_api_provider.dart';
import 'package:umra/pages/common/terms_conditions/models/terms_conditions_model.dart';


abstract class ITermsConditionRepository {
  Future<TermsAndConditionsModel> getTermsAndConditions();


}

class TermsConditionRepository extends BaseRepository implements ITermsConditionRepository {
  TermsConditionRepository({required this.provider});
  final ITermsConditionProvider provider;

  @override
  Future<TermsAndConditionsModel> getTermsAndConditions() async{
    final apiResponse = await provider.getTermsAndConditions( ) ;
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
