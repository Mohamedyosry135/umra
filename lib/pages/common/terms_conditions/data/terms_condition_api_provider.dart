import 'package:get/get.dart';
// ignore: one_member_abstracts

import 'package:umra/base/api_end_points.dart';
import 'package:umra/base/base_auth_provider.dart';
import 'package:umra/pages/common/terms_conditions/models/terms_conditions_model.dart';

abstract class ITermsConditionProvider {
  Future<Response<TermsAndConditionsModel>> getTermsAndConditions();
}

class TermsConditionProvider extends BaseAuthProvider
    implements ITermsConditionProvider {
  @override
  Future<Response<TermsAndConditionsModel>> getTermsAndConditions() async {
    Response<TermsAndConditionsModel> resp = await get<TermsAndConditionsModel>(
      UserEndPoints.termsCondition,
      decoder: TermsAndConditionsModel.fromJson,
    );

    return resp;
  }
}
